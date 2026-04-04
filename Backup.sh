# Create a backup directory dynamic
backup_dir="backup-$today"
source_file="/var/log/syslog"
# Checking if directory is exists
echo "Checking for directory: $backup_dir"
if [[ -d "$backup_dir" ]]; then
        # This block runs if is true
        echo "Error: directory already exists"
else
        # This creates the directory if is false
        echo "Directory is not found, Creating..."
        # Printt what we are doing
        echo "Creating a backup directory: $backup_dir."
        # Execute the command
        mkdir "$backup_dir"
        echo "Backup directory created successfully."
fi
# Checking if the source file exists And is readable
if [[ ! -f "$source_file" || ! -r "$source_file" ]]; then
       echo "Error: Source file $source_file doesn't exist or is not readable"
       exit 1;
fi       
# Checking if the source file is empty
if [[ ! -s $source_file ]]; then 
        echo"Warning: Source file $source_file is empty. Backing up anyway."
# Copy the source file to the backup directory.
cp "$source_file" "$backup_dir/syslog.bak"
echo"$source_file backed up successfully to $backup_dir."