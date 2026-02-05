#include<iostream>
#include<filesystem>
#include<unordered_map>
#include<vector>
#include<string>
#include<algorithm>
#include<cctype>
#include<chrono>
#include<iomanip>

using namespace std;
namespace fs=std::filesystem;

static string to_lower(const string &s){
    string out;
    out.reserve(s.size());
    for (char c: s) out.push_back(tolower(c));
    return out;
}

static string ext_no_dot_lower(const fs::path &p){
    auto e=p.extension().string();
    if(e.size()!=0 and e[0]=='.') e.erase(0, 1);
    return to_lower(e);
}

static fs::path unique_target_path(const fs::path &target){
    if(!fs::exists(target)) return target;

    fs::path parent=target.parent_path();
    string stem=target.stem().string();
    string ext=target.extension().string();

    int c=1;
    while(true){
        string tem_target=stem+" ("+to_string(c)+")"+ext;
        fs::path p=parent/tem_target;
        if(!fs::exists(p)) return p;
        c++;
    }
}

static const unordered_map<string, string> extension_map={
    {"jpg", "Images"}, {"jpeg", "Images"}, {"png", "Images"}, {"gif", "Images"},
    {"bmp", "Images"}, {"tiff", "Images"}, {"svg", "Images"}, {"webp", "Images"},
    {"iso", "Images"}, {"img", "Images"},

    {"pdf", "Documents"}, {"doc", "Documents"}, {"docx", "Documents"},
    {"txt", "Documents"}, {"rtf", "Documents"}, {"odt", "Documents"},
    {"xls", "Documents"}, {"xlsx", "Documents"}, {"csv", "Documents"},
    {"ppt", "Documents"}, {"pptx", "Documents"},

    {"mp3", "Music"}, {"wav", "Music"}, {"flac", "Music"}, {"aac", "Music"},
    {"ogg", "Music"}, {"m4a", "Music"},

    {"mp4", "Videos"}, {"mkv", "Videos"}, {"mov", "Videos"}, {"avi", "Videos"},
    {"flv", "Videos"}, {"wmv", "Videos"},

    {"zip", "Archives"}, {"rar", "Archives"}, {"7z", "Archives"}, {"tar", "Archives"},
    {"gz", "Archives"}, {"bz2", "Archives"},

    {"cpp", "Code"}, {"c", "Code"}, {"h", "Code"}, {"hpp", "Code"}, {"py", "Code"},
    {"java", "Code"}, {"js", "Code"}, {"ts", "Code"}, {"html", "Code"}, {"css", "Code"},

    {"ttf", "Fonts"}, {"otf", "Fonts"}
};

static string folder_for_extension(const string &ext){
    if(ext.empty()) return "NoExtension";
    auto it=extension_map.find(ext);
    if(it != extension_map.end()) return it->second;
    return "Others";
}

struct status {
    uint64_t moved=0;
    uint64_t skipped=0;
    uint64_t errors=0;
};

static void log_msg(const string &msg){
    auto now=std::chrono::system_clock::now();
    std::time_t t=std::chrono::system_clock::to_time_t(now);
    std::tm tm{};

    #if defined(_WIN32) 
        localtime_s(&tm, &t);
    #else
        localtime_r(&t, &tm);
    #endif
        cout<<"["<<std::put_time(&tm, "%F %T")<<"] "<<msg<<endl;
}

int main(int argc, char* argv[]){
    cout<<"FILE ORGANIZER - organize files into folders by type."<<endl;
    cout<<"Usage: "<<(argc>0 ? argv[0] : "organizer")<<" <target-directory> [--dry-run] [--recursive]"<<endl<<endl;

    if(argc<2){
        cerr<<"Error: target directory required."<<endl;
        return 1;
    }

    bool dry_run=false, recursive=false;
    fs::path target_dir=fs::u8path(argv[1]);

    if(!fs::exists(target_dir) or !fs::is_directory(target_dir)){
        cerr<<"Error: directory does not exist or is not a directory: "<<target_dir<<endl;
        return 2;
    }

    for(int i=2; i<argc; i++){
        string arg=argv[i];
        if(arg=="--dry-run" or arg=="-d") dry_run=true;
        if(arg=="--recursive" or arg=="-r") recursive=true;
    }

    log_msg(string("Target: ")+target_dir.string()+(dry_run ? " (dry-run)" : ""));
    if(recursive) log_msg("Running in recursive mode.");

    status stat;
    vector<fs::path> files_to_process;

    try{
        if(recursive){
            for(auto const &entry:fs::recursive_directory_iterator(target_dir)){
                if(!entry.is_regular_file()) continue;

                fs::path rel=fs::relative(entry.path(), target_dir);
                if(rel.empty()) continue;
                if(rel.begin()!=rel.end()){
                    auto first_path=*rel.begin();
                    string first = first_path.string();

                    for(auto const &kf:extension_map){
                        if(first==kf.second) goto skip_entry;
                    }
                    files_to_process.push_back(entry.path());
                    skip_entry: ;
                }
            }
        }

        else{
            for(auto const &entry:fs::directory_iterator(target_dir)){
                if(!entry.is_regular_file()) continue;
                files_to_process.push_back(entry.path());
            }
        }
    }
    catch(const exception &e){
        cerr<<"Error while scanning directory: "<<e.what()<<endl;
        return 3;
    }

    log_msg("File Found: "+to_string(files_to_process.size()));

    for(auto const &file: files_to_process){
        try{
            string ext=ext_no_dot_lower(file);
            string folder_name=folder_for_extension(ext);

            fs::path dest_dir=target_dir/folder_name;
            if(!dry_run){
                if(!fs::exists(dest_dir)){
                    fs::create_directories(dest_dir);
                    log_msg("Created directory: " + dest_dir.string());
                }
            }
            
            fs::path dest=dest_dir/file.filename();
            dest=unique_target_path(dest);

            if(dry_run){
                cout<<"[DRY] Move: "<<file<<" -> "<<dest<<endl;
                stat.skipped++;
                continue;
            }

            fs::rename(file, dest);
            log_msg("Moved: "+file.string()+" -> "+dest.string());
            stat.moved++;
        }
        catch(const fs::filesystem_error &e){
            cerr<<"Filesystem error on '"<<file<<"': "<<e.what()<<endl;
            stat.errors++;
        }
        catch(const exception &e){
            cerr<<"Error on '"<<file<<"': "<<e.what()<<endl;
            stat.errors++;
        }
    }

    log_msg("Done. Moved: " + to_string(stat.moved)+"' Skipped (dry-run or filtered): " + to_string(stat.skipped)+ "' Errors: "+to_string(stat.errors));

    return 0;
}