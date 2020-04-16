main() {
  String name;
  User user = User(name);
  print(user.name);
  List<User> users;
  if(users.isEmpty){
    print("user 为null");
  }

}


class User {
  String name;
  User(this.name){
    name = "as";
  }
}
