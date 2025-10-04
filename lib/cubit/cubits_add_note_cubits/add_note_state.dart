class AddNoteStates{}
class AddNoteInitial extends AddNoteStates{}
class AddNoteLoading extends AddNoteStates{}
class AddNoteSuccess extends AddNoteStates{}
class AddNoteFailure extends AddNoteStates{
  final String message;
  AddNoteFailure({required this.message});
}


