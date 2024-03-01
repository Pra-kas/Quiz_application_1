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
  bool img = true;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        imgpath = pickedImage.path;
      });
    }
  }

    // ignore: non_constant_identifier_names
    Container profile_content(String content) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 223, 220, 220),
        ),
        child: Text(content),
      );
  }
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool x = width < height;
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
            
                Padding(
                  padding: EdgeInsets.only(top: height/23),
                  child: const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
            
                Padding(
                  padding: EdgeInsets.only(top: height/50),
                    child: Stack(
                      children : [

                        Padding(
                          padding: EdgeInsets.only(left: height/20,right: height/20),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular((x) ? height/13.5 : width/13.5),
                              border: Border.all(
                                color: Colors.grey,
                                width: 2,
                              )
                            ),
                          child: CircleAvatar(
                            radius: (x) ? height/13.5 : width/13.5,
                            backgroundImage: imgpath.isNotEmpty ? AssetImage(imgpath) : null,
                          ),
                        ),
                      ),
                      
                      Padding(
                        padding: EdgeInsets.only(left: width/10,right: width/10),
                        child: (img) ? IconButton(
                          onPressed: () {}, 
                          icon: const Icon(Icons.edit)
                        ) : IconButton(
                          onPressed: () {}, 
                          icon: const Icon(Icons.camera)
                        ),
                      )
                    ]
                  ),
                ),
            
                Padding(
                  padding: EdgeInsets.only(top: height/50),
                  child: const Text(
                      "Prakash kumar",
                      style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                ),
            
                  
                  Padding(
                    padding: EdgeInsets.only(top: height/100),
                    child: const Text(
                      "kumar",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                    
                Padding(
                  padding: EdgeInsets.only(top: height/15),
                  child: SizedBox(
                    child: GridView.count(
                      childAspectRatio: (x) ? 0.6 : 2,
                      crossAxisCount: (x) ? 3 : 2,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: MediaQuery.of(context).size.height/70,
                      mainAxisSpacing: MediaQuery.of(context).size.height/70,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        profile_content("World rank"),
                        profile_content("Games played"),
                        profile_content("Total points"),
                        profile_content("completion rate"),
                        profile_content("Correct answers"),
                        profile_content("Wrong answers"),
                    
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
