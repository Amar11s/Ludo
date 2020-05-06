import 'package:equatable/equatable.dart';

class Position  extends Equatable{
  final int row;
  final int column;
  Position(this.row,this.column);
  Position.fromjson(Map json):
  row = json['row'],
  column =json['column'];

  Map toJson()=> {
    'row':row,
    'column':column
  };
  @override
  List<Object> get props => [row,column]; 
}