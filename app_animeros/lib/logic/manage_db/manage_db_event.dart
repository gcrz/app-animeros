//Eventos da camada da view
// 1 - Adicionar um anime a lista do usuário (INSERT)
// 2 - Alterar um anime na lista do usuário (UPDATE)
abstract class ManageEvent {}

class InsertEvent extends ManageEvent {
  Anime anime;
  InsertEvent({this.anime});
}

class UpdateRequest extends ManageEvent {
  var animeId;
  Anime anime;

  UpdateRequest({this.animeId, this.anime});
}

//É necessário o UpdateCancel ?
class UpdateCancel extends ManageEvent{}


