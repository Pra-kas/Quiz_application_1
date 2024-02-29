import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const ProfileScreen());
}

class ProfileScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String imgpath = "";
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        imgpath = pickedImage.path;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            
                Text(
                  "Profile"
                ),
            
                SizedBox(
                  child: CircleAvatar(
                    radius: width/6,
                    backgroundImage: imgpath.isNotEmpty ? AssetImage(imgpath) : null,
                  ),
                ),
            
                const Text(
                    "Prakash kumar",
                    style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  ),
            
                  
                  const Text(
                    "kumar",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                    
            
                Container(child: const ProfileGrid())
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileGrid extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ProfileGrid({Key? key});

  @override
  State<ProfileGrid> createState() => _ProfileGridState();
}

class _ProfileGridState extends State<ProfileGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.8,
      crossAxisCount: 3,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 223, 220, 220),
          ),
          child: const Text("world rank"),
        ),
        Container(
          padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 223, 220, 220),
          ),          
          child: const Text('games played'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 223, 220, 220),
          ),          
          child: const Text('points'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 223, 220, 220),
          ),
          child: const Text('completion rate'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 223, 220, 220),
          ),
          child: const Text('correct answer'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 223, 220, 220),
          ),
          child: const Text('wrong answer'),
        ),
      ],
    );
  }
}
