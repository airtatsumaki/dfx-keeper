import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeeper{

    public type Note = {
      title: Text;
      content: Text;
    };

    stable var notes : List.List<Note> = List.nil<Note>();

    public query func readNotes() : async [Note] {
      return List.toArray(notes);
    };

    public func createNote(titleText: Text, contentText: Text){
      
      let newNote: Note = {
        title = titleText;
        content = contentText;
      };

      notes := List.push(newNote, notes);
      Debug.print(debug_show(notes));
    };

    public func deleteNote(index: Nat){
      let list1 = List.take(notes, index);
      let list2 = List.drop(notes, index + 1);
      notes := List.append(list1, list2);
      Debug.print("ITEM DELETED");
      Debug.print(debug_show(notes));
    };
};
