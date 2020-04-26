String data = "start";

main() {
  print("start");
  getData();
  print("end");

}


getData() async {
//  data = await Future.delayed(Duration(seconds: 3), () {
//    print("getData wait print");
//    return "getData wait done";
//  });

  await print("getData wait print");


//  print(data);
}