import './position.dart';
enum TokenType {
  green,
  yellow,
  blue,
  red
}
enum TokenState{
  initial,
  home,
  normal,
  safe,
  safeinpair
}
class Token
{
  final int  id;
  final TokenType  type;
  Position   tokenPosition;
  TokenState tokenState;
  int        positionInPath;
  Token(this.type,this.tokenPosition,this.tokenState,this.id);
  
  Token.fromjson(Map json):
    id = json['id'],
    type = TokenType.values[json['TokenType']],
    tokenState = TokenState.values[json['TokenState']],
    positionInPath = json['PositionInPath'],
    tokenPosition = Position.fromjson(json['Position']);
  

  Map toJson() {
    Map tokenPosition =
        this.tokenPosition != null ? this.tokenPosition.toJson() : null;
    return {'id': id, 'TokenType': type.index, 'Position': tokenPosition,'TokenState':tokenState.index,'PositionInPath':positionInPath};
  }

}