import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('H O M E'),
      ),
      backgroundColor: Color.fromARGB(
          255, 255, 255, 255), // Set background color to transparent
      body: SingleChildScrollView(child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 250,
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 233, 233, 233),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L2lzMTY1NDktaW1hZ2Uta3d2eWhnbXguanBn.jpg",
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        "https://static.vecteezy.com/system/resources/previews/027/312/350/original/portrait-of-a-female-graduate-student-isolated-essential-workers-avatar-icons-characters-for-social-media-and-networking-user-profile-website-and-app-3d-render-illustration-png.png",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("W E L C O M E",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("N A M E"),
                        ElevatedButton(
                          child: Text("R E S U M E"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResumeInputScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewAssignmentsScreen()),
                      );
                    },
                    icon: Icon(Icons.schedule, size: 35),
                    label: Text('A S S I G N M E N T S',
                        style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(16),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewSeminarsScreen()),
                      );
                    },
                    icon: Icon(Icons.assignment_turned_in, size: 35),
                    label:
                        Text('S E M I N A R S', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(16),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ExamsScreen()),
                      );
                    },
                    icon: Icon(Icons.edit, size: 35),
                    label: Text('E X A M S', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewSemesterScreen()),
                      );
                    },
                    icon: Icon(Icons.leaderboard, size: 35),
                    label: Text('T I M E  T A B L E',
                        style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(16),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewSemesterScreen()),
                      );
                    },
                    icon: Icon(Icons.leaderboard, size: 35),
                    label: Text('S E M E S T E R   T I M E  T A B L E',
                        style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(16),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotesScreen()),
                      );
                    },
                    icon: Icon(Icons.leaderboard, size: 35),
                    label: Text('N O T E S',
                        style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(16),
                    ),
                  ),
                ]),
          )
        ],
      ),
      //   ),
       ),
    );
  }
}

class ClassSchedulesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Schedules'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('semester').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Text('No data available.');
            }
            return GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: snapshot.data!.docs.map((document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.schedule, size: 40, color: Colors.blue),
                        SizedBox(height: 8),
                        Text('Class: ${data['Hour']}',
                            style: TextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                        Text('Details: ${data['Detail']}',
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}

class ExamsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E X A M S'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('examTimetable')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Text('No data available.');
            }
            return GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: snapshot.data!.docs.map((document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.assignment_turned_in,
                            size: 40, color: Colors.green),
                        SizedBox(height: 8),
                        Text('EXAM TYPE: ${data['examType']}',
                            style: TextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                        Text('DATE: ${data['date']}',
                            style: TextStyle(fontSize: 14)),
                        Text('EXAM: ${data['exam']}',
                            style: TextStyle(fontSize: 14)),
                        Text('SEMESTER: ${data['semester']}',
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}

class ResumeInputScreen extends StatefulWidget {
  @override
  _ResumeInputScreenState createState() => _ResumeInputScreenState();
}

class _ResumeInputScreenState extends State<ResumeInputScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Text editing controllers for each field
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _introController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  final TextEditingController _academicsController = TextEditingController();
  final TextEditingController _schoolingController = TextEditingController();
  final TextEditingController _graduationController = TextEditingController();
  final TextEditingController _interestsController = TextEditingController();
  final TextEditingController _hobbiesController = TextEditingController();
  final TextEditingController _certificationsController =
      TextEditingController();
  final TextEditingController _achievementsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Add more complex email validation if needed
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  // Add more complex phone number validation if needed
                  return null;
                },
              ),
              TextFormField(
                controller: _introController,
                decoration: InputDecoration(labelText: 'Introduction'),
                maxLines: 5,
              ),
              TextFormField(
                controller: _skillsController,
                decoration:
                    InputDecoration(labelText: 'Skills (comma separated)'),
              ),
              TextFormField(
                controller: _academicsController,
                decoration: InputDecoration(labelText: 'Academics'),
              ),
              TextFormField(
                controller: _schoolingController,
                decoration: InputDecoration(labelText: 'Schooling'),
              ),
              TextFormField(
                controller: _graduationController,
                decoration: InputDecoration(labelText: 'Graduation Scores'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _interestsController,
                decoration: InputDecoration(labelText: 'Interested Areas'),
              ),
              TextFormField(
                controller: _hobbiesController,
                decoration: InputDecoration(labelText: 'Hobbies'),
              ),
              TextFormField(
                controller: _certificationsController,
                decoration: InputDecoration(labelText: 'Certifications'),
              ),
              TextFormField(
                controller: _achievementsController,
                decoration: InputDecoration(labelText: 'Achievements'),
                maxLines: 5,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _generateResume();
                  }
                },
                child: Text('Generate & Share'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _generateResume() async {
    // Generate resume content
    final String name = _nameController.text;
    final String address = _addressController.text;
    final String email = _emailController.text;
    final String phone = _phoneController.text;
    final String intro = _introController.text;
    final String skills = _skillsController.text;
    final String academics = _academicsController.text;
    final String schooling = _schoolingController.text;
    final String graduation = _graduationController.text;
    final String interests = _interestsController.text;
    final String hobbies = _hobbiesController.text;
    final String certifications = _certificationsController.text;
    final String achievements = _achievementsController.text;

    // Create a PDF document
    final pdf = pw.Document();

    // Add a page with A4 format and build content
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Name: $name'),
              pw.SizedBox(height: 10), // Add spacing between sections
              pw.Text('Address: $address'),
              pw.Text('Email: $email'),
              pw.Text('Phone: $phone'),
              pw.Divider(), // Add a divider between sections
              pw.Text('Introduction:'),
              pw.Text(intro),
              pw.Text('Skills:'),
              pw.Text(skills),
              pw.Text('Academics:'),
              pw.Text(academics),
              pw.Text('Schooling:'),
              pw.Text(schooling),
              pw.Text('Graduation Scores: $graduation'),
              pw.Text('Interested Areas:'),
              pw.Text(interests),
              pw.Text('Hobbies:'),
              pw.Text(hobbies),
              pw.Text('Certifications:'),
              pw.Text(certifications),
              pw.Text('Achievements:'),
              pw.Text(achievements),
            ],
          );
        },
      ),
    );

    // Get the temporary directory
    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/resume.pdf');

    // Save the PDF document
    await file.writeAsBytes(await pdf.save());

    // Share the PDF using the share package
    Share.shareFiles([file.path], text: 'My Resume');
  }
}

class ViewSeminarsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Seminars'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('seminars').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No seminars available'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              Map<String, dynamic> seminarData =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Card(
                  elevation: 2.0,
                  child: ListTile(
                    title: Text('STUDENT: ${seminarData['students']}'),
                    subtitle: Text('TOPIC : ${seminarData['topics']}'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SeminarDetailScreen(seminarData: seminarData),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SeminarDetailScreen extends StatelessWidget {
  final Map<String, dynamic> seminarData;

  const SeminarDetailScreen({Key? key, required this.seminarData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seminar Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'STUDENT: ${seminarData['students']}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'TOPIC: ${seminarData['topics']}',
            ),
            // Add more details if needed
          ],
        ),
      ),
    );
  }
}

class ViewSemesterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('T I M E   T A B L E'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('semester').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No semester data available'));
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.0,
            ),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final semesterNumber = snapshot.data!.docs[index].id;
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewSemesterDetailsScreen(
                          semesterNumber: semesterNumber),
                    ),
                  );
                },
                child: Container(margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(
                          255, 221, 222, 223)), // Background color of the tile
                  child: Center(
                    child: Text(
                      "DAY ${index + 1}",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ViewSemesterDetailsScreen extends StatelessWidget {
  final String semesterNumber;

  const ViewSemesterDetailsScreen({Key? key, required this.semesterNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Semester Data'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('semester')
            .doc(semesterNumber)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(
                child: Text('No data available for Semester $semesterNumber'));
          }

          Map<String, dynamic> semesterData =
              snapshot.data!.data() as Map<String, dynamic>;

          return ListView.builder(
            itemCount: semesterData.length ~/
                2, // Assuming each hour has a corresponding detail
            itemBuilder: (context, index) {
              final hourKey = 'Hour ${index + 1}';
              final detailKey = 'Detail ${index + 1}';
              final hourValue = semesterData[hourKey];
              final detailValue = semesterData[detailKey];

              // Generate a color based on the index
              final color = _generateColor(index);

              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                color: color,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hour ${index + 1}:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Detail ${index + 1}: $detailValue'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Color _generateColor(int index) {
    // Example: Generate color based on index
    final colors = [
      Color.fromARGB(255, 255, 153, 145),
      Color.fromARGB(255, 163, 214, 255),
      const Color.fromARGB(255, 194, 255, 196),
      Color.fromARGB(255, 255, 227, 185),
      const Color.fromARGB(255, 245, 185, 255),
      Colors.yellow,
      const Color.fromARGB(255, 175, 255, 247),
      const Color.fromARGB(255, 255, 177, 203),
    ];
    return colors[index % colors.length];
  }
}

class ViewAssignmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A S S I G N M E N T S'),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('assignments').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No assignments available'));
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> assignmentData =
                  document.data() as Map<String, dynamic>;
              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('STUDENTS : ${assignmentData['students']}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text('ASSIGNMNET NO: ${assignmentData['assignmnetNumber']}'),
                      Text('TOPICS: ${assignmentData['topics']}'),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
class NoteForm extends StatefulWidget {
  final bool isPublic;
  final String userId;

  const NoteForm({Key? key, required this.isPublic, required this.userId})
      : super(key: key);

  @override
  _NoteFormState createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _noteController,
            maxLines: 5,
            decoration: InputDecoration(
              labelText: 'Note',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Save the note to the appropriate collection based on isPublic value
              saveNote();
              Navigator.pop(context); // Go back to the previous screen
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void saveNote() async {
    // Get the note text
    final String noteText = _noteController.text;

    // Save the note to either public or private collection based on isPublic value
    if (widget.isPublic) {
      try {
        await FirebaseFirestore.instance.collection('public_notes').add({
          'text': noteText,
          'userId': widget.userId, // Store the user's ID
          'timestamp': Timestamp.now(),
        });
      } catch (e) {
        print('Error saving public note: $e');
        // Handle error if necessary
      }
    } else {
      try {
        await FirebaseFirestore.instance.collection('private_notes').add({
          'text': noteText,
          'userId': widget.userId, // Store the user's ID
          'timestamp': Timestamp.now(),
        });
      } catch (e) {
        print('Error saving private note: $e');
        // Handle error if necessary
      }
    }
  }
}

class NotesScreen extends StatefulWidget {
  final String userId;

  const NotesScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('N O T E S'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  _navigateToAddNoteScreen(true); // Navigate to add public note
                },
                child: Text('Add Public Note'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _navigateToAddNoteScreen(false); // Navigate to add private note
                },
                child: Text('Add Private Note'),
              ),
              SizedBox(height: 20),
              Text('Public Notes:'),
              SizedBox(height: 10),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('public_notes')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text('No public notes available.');
                  }

                  return Column(
                    children: snapshot.data!.docs.map((document) {
                      Map<String, dynamic> noteData =
                          document.data() as Map<String, dynamic>;
                      return ListTile(
                        title: Text(noteData['text'] ?? ''),
                        // You can display other note details here
                      );
                    }).toList(),
                  );
                },
              ),
              SizedBox(height: 20),
              Text('Private Notes:'),
              SizedBox(height: 10),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('private_notes')
                    .where('userId', isEqualTo: widget.userId)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text('No private notes available.');
                  }

                  return Column(
                    children: snapshot.data!.docs.map((document) {
                      Map<String, dynamic> noteData =
                          document.data() as Map<String, dynamic>;
                      return ListTile(
                        title: Text(noteData['text'] ?? ''),
                        // You can display other note details here
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToAddNoteScreen(bool isPublic) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoteForm(
          isPublic: isPublic,
          userId: widget.userId,
        ),
      ),
    );
  }
}