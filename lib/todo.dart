class ToDo{
  String? id;
  String? todoText;
  bool isDone;

 ToDo({
    required this.id,
  required this.todoText,
  this.isDone=false,

});

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Sabah Yürüyüşü', isDone: true ),
      ToDo(id: '02', todoText: 'Mail kontrolü', isDone: true ),
      ToDo(id: '03', todoText: 'Canlı Dersler', ),
      ToDo(id: '04', todoText: 'Okul ödevleri', ),
      ToDo(id: '05', todoText: 'Akşam yemeği hazırla', ),
      ToDo(id: '06', todoText: 'Etrafı topla', ),
    ];
  }
}