dir_path="$1"
fromExtension="$2"
toExtension="$3"

if [[ ! -d "$dir_path" ]]; then
        echo "Error: Directory not found."
        echo "Usage: "$S0" directory_path originalExtension wantedExtension"
        echo "Example: "$0" /root/Images .txt .sh"
        exit 1;
fi

echo "Directory found!"
echo "Searching for files with extension \"$fromExtension\"..."

converted=false

for file in "$dir_path"/*"$fromExtension"; do
        if [[ -f "$file" ]]; then
                new_file="${file%$fromExtension}$toExtension"
                mv "$file" "$new_file"
                echo "File $file is successfully converted to $new_file."
                converted=true
        fi
done

if [[ ! "$converted" ]]; then
        echo "No files with extension \"$fromExtension\""
fi