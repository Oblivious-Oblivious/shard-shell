class ShardShell::Walker
    @mods = {} of String => String;

    getter :mods;

    private def get_timestamp(file : String)
        File.info(file).modification_time.to_s "%Y%m%d%H%M%S";
    end

    def get_directory_list(starting_dir)
        Dir.glob(starting_dir, match_hidden: true) do |file|
            timestamp = get_timestamp file;
            if mods[file]? != timestamp
                mods[file] = timestamp;
                yield file;
            end
        end
    end
end
