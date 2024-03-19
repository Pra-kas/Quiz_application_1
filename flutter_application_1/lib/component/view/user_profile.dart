import 'package:flutter_application_1/data/repository/UserDetails.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const ProfileScreen());
}

class ProfileScreen extends StatefulWidget {
  final dynamic profiledetails; // List of questions
  const ProfileScreen({Key? key, this.profiledetails}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String imgpath = "";
  bool img = true;
  String username = ""; // Add a variable to store the username

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        imgpath = pickedImage.path;
      });
    }
  }

// Future<String> fetchUsername() async {
//   try {
//     var email = 'pk@gmail.com';
//     var url = Uri.parse('http://localhost:3000/getProfileDetails');
    
//     var response = await http.post(url, headers: {"Content-Type": "plain/text"}, body: jsonEncode(email));

//     if (response.statusCode == 200) {
//       var jsonResponse = jsonDecode(response.body);
//       var username = jsonResponse['message']; // Assuming 'message' contains the username
//       return username;
//     } else {
//       print('Failed to fetch username: ${response.statusCode}');
//     }
//   } catch (error) {
//     print('Error fetching username: $error');
//   }
//   return "";
// }


  Container profileContent(String content, String value) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 223, 220, 220),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(content),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text(value as String),
          ),
        ],
      ),
    );
  }

//   @override
// @override
// void initState() {
//   super.initState();
//   fetchUsername().then((value) {
//     setState(() {
//       username = value;
//       print(username);
//     });
//   }).catchError((error) {
//     print('Error initializing username: $error');
//   });
// }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool x = width < height;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: height / 23),
                child: const Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 50),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: height / 20, right: height / 20),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular((x) ? height / 13.5 : width / 13.5),
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: (x) ? height / 13.5 : width / 13.5,
                          backgroundImage: imgpath.isNotEmpty ? AssetImage(imgpath) : null,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width / 10, right: width / 10),
                      child: (img)
                          ? IconButton(
                              onPressed: () {
                                _pickImage();
                              },
                              icon: const Icon(Icons.edit),
                            )
                          : IconButton(
                              onPressed: () {
                                _pickImage();
                              },
                              icon: const Icon(Icons.camera),
                            ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 50),
                child: Text(
                  User.name, // Display the fetched username here
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 100),
                child: const Text(
                  "kumar",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 15),
                child: SizedBox(
                  child: GridView.count(
                    childAspectRatio: (x) ? 0.8 : 2,
                    crossAxisCount: (x) ? 2 : 2,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: MediaQuery.of(context).size.height / 70,
                    mainAxisSpacing: MediaQuery.of(context).size.height / 70,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      profileContent("Gamesplayed", User.totalquiz),
                      profileContent("Total points", User.totalpoint),
                      profileContent("Correct answers", User.totalcorrect),
                      profileContent("Wrong answers", User.totalwrong),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
