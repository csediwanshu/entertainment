class User {
  String name;
  String phoneno;
  String pnrno;
 

  User();

  Map toMap(User user) {
    var data = Map<String, dynamic>();
    data['name'] = user.name;
    data['phoneno'] = user.phoneno;
    data['pnrno'] = user.pnrno;
    
    return data;
  }

  User.fromMap(Map<String, dynamic> mapData) {
    this.name = mapData['name'];
    this.phoneno = mapData['phoneno'];
    this.pnrno = mapData['pnrno'];
    
  }
}
