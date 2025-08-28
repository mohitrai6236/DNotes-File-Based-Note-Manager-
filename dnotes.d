import std.stdio;
import std.file;
import std.json;
import std.algorithm;

string notesFile = "notes.json";

void saveNotes(JSONValue notes) {
    write(notesFile, notes.toPrettyString());
}

JSONValue loadNotes() {
    if (!exists(notesFile)) return JSONValue([]);
    return parseJSON(cast(string) read(notesFile));
}

void main(string[] args) {
    if (args.length < 2) {
        writeln("Usage: ./dnotes [add|list|delete] <note>");
        return;
    }

    auto notes = loadNotes();
    string command = args[1];

    if (command == "add" && args.length > 2) {
        notes.array ~= JSONValue(args[2]);
        saveNotes(notes);
        writeln("Note added!");
    } else if (command == "list") {
        foreach (i, n; notes.array) {
            writeln(i + 1, ". ", n.str);
        }
    } else if (command == "delete" && args.length > 2) {
        size_t idx = to!size_t(args[2]) - 1;
        if (idx < notes.array.length) {
            notes.array = notes.array.remove(idx);
            saveNotes(notes);
            writeln("Note deleted!");
        } else {
            writeln("Invalid note number.");
        }
    } else {
        writeln("Invalid command.");
    }
}
