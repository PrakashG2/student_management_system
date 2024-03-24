
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text('ADMIN'),
      ),
      body: Padding(padding: EdgeInsets.all(15),child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 250,
            // margin: EdgeInsets.all(15),
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
                        Text("WELCOME",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black)),
                        Text("ADMIN",
                            style: TextStyle(
                                fontSize: 16, color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClassSchedulesScreen()),
              );
            },
            icon: Icon(Icons.schedule, color: Colors.white),
            label: Text('CLASS SCHEDULES', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamsScreen()),
              );
            },
            icon: Icon(Icons.event_note, color: Colors.white),
            label: Text('EXAMS', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            )
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalendarScreen()),
              );
            },
            icon: Icon(Icons.calendar_today, color: Colors.white),
            label: Text('CALENDAR', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () async {
              // Fetch the user ID from Firebase Authentication
              User? user = _auth.currentUser;
              if (user != null) {
                String userId = user.uid;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotesScreen(userId: userId),
                  ),
                );
              } else {
                // Handle the case where user is not authenticated
                // You can redirect user to login screen or handle it according to your app's flow
              }
            },
            icon: Icon(Icons.note, color: Colors.white),
            label: Text('NOTES', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
           onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResourcesScreen()),
              );
            },
            icon: Icon(Icons.folder, color: Colors.white),
            label: Text('RESOURCES', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        
        ]
      ),)
    );
  }
}


// ----------------------> CLASS SHEDULES


class ClassSchedulesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('C L A S S  S H E D U L E S'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClassOrderScreen()),
                );
              },
              child: Text('D A Y   O R D E R'),
            ),            SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddAssignmentsScreen()),
                );
              },
              child: Text('Assignments'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddSeminarsScreen()),
                );
              },
              child: Text('Seminars'),
            ),
            // Add more buttons as needed
          ],
        ),
      ),
    );
  }
}



// ----------------> ADD ASSIGNMENTS SCREEN





class AddAssignmentsScreen extends StatelessWidget {
  final TextEditingController studentsController = TextEditingController();
  final TextEditingController topicsController = TextEditingController();
    final TextEditingController assNumController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A D D   A S S I G N M E N T S'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextField(
                controller: studentsController,
                maxLines: null, // Allow multiline input
                decoration: InputDecoration(labelText: 'Students'),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: topicsController,
                maxLines: null, // Allow multiline input
                decoration: InputDecoration(labelText: 'Topics'),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: assNumController,
                maxLines: null,
                decoration: InputDecoration(labelText: 'A S S I G N M E N T   N U M B E R'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveDataToFirestore(
            context,
            'assignments',
            {
              'students': studentsController.text,
              'topics': topicsController.text,
              'assignmnetNumber': assNumController.text,
               
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _saveDataToFirestore(
    BuildContext context,
    String collectionName,
    Map<String, dynamic> data,
  ) async {
    try {
      await FirebaseFirestore.instance.collection(collectionName).add(data);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data saved to Firestore successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print('Error saving data to Firestore: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving data to Firestore.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
@override
  void dispose() {
    // Dispose of the controllers to free up resources
    studentsController.dispose();
    topicsController.dispose();
  }
}




//------------------------------------------------> ADD SEMINAR SCREEN


class AddSeminarsScreen extends StatelessWidget {
   final TextEditingController studentsController = TextEditingController();
  final TextEditingController topicsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Seminars'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextField(
                controller: studentsController,
                maxLines: null, // Allow multiline input
                decoration: InputDecoration(labelText: 'Students'),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: topicsController,
                maxLines: null, // Allow multiline input
                decoration: InputDecoration(labelText: 'seminar content'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveDataToFirestore(
            context,
            'seminars',
            {
              'students': studentsController.text,
              'topics': topicsController.text,
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _saveDataToFirestore(
    BuildContext context,
    String collectionName,
    Map<String, dynamic> data,
  ) async {
    try {
      await FirebaseFirestore.instance.collection(collectionName).add(data);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data saved to Firestore successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print('Error saving data to Firestore: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving data to Firestore.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
@override
  void dispose() {
    // Dispose of the controllers to free up resources
    studentsController.dispose();
    topicsController.dispose();
  }


}



//----------------------------------------------------> EXAM SCREEN
class ExamsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exams'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CiaScreen()),
                );
              },
              child: Text('CIA'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TimetableScreen(mandatory: "SEMESTER",)),
                );
              },
              child: Text('SEMESTER'),
            ),
          ],
        ),
      ),
    );
  }
}


//--------------------------------------------------------------------> CIA SCREEN

class CiaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CIA'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to TimetableScreen when CIA 1 is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TimetableScreen(mandatory: "CIA1",)),
                );
              },
              child: Text('CIA 1'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
             onPressed: () {
                // Navigate to TimetableScreen when CIA 1 is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TimetableScreen(mandatory: "CIA2",)),
                );
              },
              child: Text('CIA 2'),
            ),
          ],
        ),
      ),
    );
  }
}


//----------------------------------------------------------------------------------------->  TIMETABLE SCREEN



class TimetableScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController examTypeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController examController = TextEditingController();
  final TextEditingController semesterController = TextEditingController();
  // final TextEditingController yearController = TextEditingController();

  final String mandatory;

  TimetableScreen({Key? key, required this.mandatory}) : super(key: key) {
    examTypeController.text = mandatory;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: examTypeController,
                enabled: false,
                decoration: InputDecoration(labelText: 'Exam Type'),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: dateController,
                decoration: InputDecoration(labelText: 'Date'),
                validator: (value) => _validateInput(value, 'date'),
              ),
              TextFormField(
                controller: examController,
                decoration: InputDecoration(labelText: 'Exam'),
                validator: (value) => _validateInput(value, 'exam'),
              ),
              TextFormField(
                controller: semesterController,
                decoration: InputDecoration(labelText: 'Semester'),
                validator: (value) => _validateInput(value, 'semester'),
              ),
              // TextFormField(
              //   controller: yearController,
              //   decoration: InputDecoration(labelText: 'Year'),
              //   validator: (value) => _validateInput(value, 'year'),
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _submitForm(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  String? _validateInput(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter a $fieldName.';
    }
    return null;
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed to save data to Firestore
      _saveDataToFirestore(
            context,
            'examTimetable',
            {
             'examType': examTypeController.text,
        'date': dateController.text,
        'exam': examController.text,
        'semester': semesterController.text,
        // 'year': yearController.text,
            },
          );
      // Optionally, you can navigate or show a success message here
    }
  }

  Future<void> _saveDataToFirestore(
    BuildContext context,
    String collectionName,
    Map<String, dynamic> data,
  ) async {
    try {
      await FirebaseFirestore.instance.collection(collectionName).add(data);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data saved to Firestore successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print('Error saving data to Firestore: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving data to Firestore.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }


 
  @override
  void dispose() {
    // Dispose of controllers to prevent memory leaks
    examTypeController.dispose();
    dateController.dispose();
    examController.dispose();
    semesterController.dispose();
    // yearController.dispose();
  }
}



//------------------------------------------------------------------------------------>  SEMESTER SCREEN




class ClassOrderScreen extends StatefulWidget {
  @override
  _ClassOrderScreenState createState() => _ClassOrderScreenState();
}

class _ClassOrderScreenState extends State<ClassOrderScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<TextEditingController> hourControllers = List.generate(
    8,
    (index) => TextEditingController(),
  );

  List<TextEditingController> detailControllers = List.generate(
    8,
    (index) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('D A Y  O R D E R'),
      ),
      body: Form(
        key: _formKey,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.blue, // Set your desired background color
              child: Column(
                children: [
                  TextFormField(
                    controller: hourControllers[index],
                    decoration: InputDecoration(labelText: 'Hour ${index + 1}'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field cannot be empty';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: detailControllers[index],
                    decoration: InputDecoration(labelText: 'Detail for Hour ${index + 1}'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field cannot be empty';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveDataToFirestore();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _saveDataToFirestore() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Create a map to hold the data for each hour
        Map<String, dynamic> data = {};

        for (int i = 0; i < hourControllers.length; i++) {
          data['Hour ${i + 1}'] = hourControllers[i].text;
          data['Detail ${i + 1}'] = detailControllers[i].text;
        }

        // Save the data to Firestore
        await FirebaseFirestore.instance.collection('semester').add(data);

        // Optionally, you can show a success message or navigate to another screen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Data saved to Firestore successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      } catch (e) {
        print('Error saving data to Firestore: $e');
        // Handle error, show an error message, etc.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving data to Firestore.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    // Dispose of controllers to prevent memory leaks
    for (var controller in hourControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}



class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  Map<DateTime, List<Color>> _events = {}; // Map to store events (colors) for each date

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();

    // Example: Marking some important dates with different colors
    _events = {
      DateTime.now().subtract(Duration(days: 1)): [Colors.red], // Yesterday - Red color
      DateTime.now().add(Duration(days: 2)): [Colors.green],   // Tomorrow - Green color
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2025, 12, 31),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        eventLoader: (day) {
          return _events[day] ?? []; // Return the colors for the specified day
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
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
    return Scaffold(
      appBar: AppBar(
        title: Text(" A D D   N O T E"),
      ),
      body: Padding(
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
                saveNote();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void saveNote() async {
    // Get the note text
    final String noteText = _noteController.text;

    // Save the note to either public or private collection based on isPublic value
    try {
      if (widget.isPublic) {
        await FirebaseFirestore.instance.collection('public_notes').add({
          'text': noteText,
          'userId': widget.userId, // Store the user's ID
          'timestamp': Timestamp.now(),
        });
      } else {
        await FirebaseFirestore.instance.collection('private_notes').add({
          'text': noteText,
          'userId': widget.userId, // Store the user's ID
          'timestamp': Timestamp.now(),
        });
      }

      // Show success dialog
      showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text('S U C C E S S'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle, size: 80, color: Colors.green),
          SizedBox(height: 16),
          Text('N O T E  A D D E D  S U C C E S S F U L LY'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
            Navigator.of(context).pop(); // Close the note form screen
          },
          child: Text('OK'),
        ),
      ],
    );
  },
);

    } catch (e) {
      print('Error saving note: $e');
      // Handle error if necessary
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
                child: Text('A D D  P U B L I C   N O T E'),
              ),
              SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {
              //     _navigateToAddNoteScreen(false); // Navigate to add private note
              //   },
              //   child: Text('A D D  P R I V A T E   N O T E'),
              // ),
              SizedBox(height: 20),
              Text(
                'P U B L I C   N O T ES:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildNotesList('public_notes'),
              SizedBox(height: 20),
              // Text(
              //   'P R I V A T E   N O T E S:',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              // ),
              // SizedBox(height: 10),
              // _buildNotesList('private_notes'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotesList(String collection) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection(collection).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Text('No notes available.');
        }

        return Column(
          children: snapshot.data!.docs.map((document) {
            Map<String, dynamic> noteData =
                document.data() as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(noteData['text'] ?? ''),
              ),
            );
          }).toList(),
        );
      },
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
    ).then((_) {
      // Refresh notes data after returning from the add note screen
      // You may need to implement this if necessary
    });
  }
}
class AddAssignmentScreen extends StatefulWidget {
  @override
  _AddAssignmentScreenState createState() => _AddAssignmentScreenState();
}

class _AddAssignmentScreenState extends State<AddAssignmentScreen> {
  final TextEditingController _studentsController = TextEditingController();
  final TextEditingController _assignmentNumberController =
      TextEditingController();
  final TextEditingController _topicsController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Assignment'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _studentsController,
                decoration: InputDecoration(labelText: 'Students'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the students';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _assignmentNumberController,
                decoration: InputDecoration(labelText: 'Assignment Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the assignment number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _topicsController,
                decoration: InputDecoration(labelText: 'Topics'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the topics';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _addAssignment();
                  }
                },
                child: Text('Add Assignment'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addAssignment() {
    // Get values from text controllers
    String students = _studentsController.text;
    String assignmentNumber = _assignmentNumberController.text;
    String topics = _topicsController.text;

    // Add assignment data to Firestore
    FirebaseFirestore.instance.collection('assignments').add({
      'students': students,
      'assignmentNumber': assignmentNumber,
      'topics': topics,
    }).then((value) {
      // Show success message or navigate back
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Assignment added successfully'),
        duration: Duration(seconds: 2),
      ));
      // Clear text fields
      _studentsController.clear();
      _assignmentNumberController.clear();
      _topicsController.clear();
    }).catchError((error) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to add assignment: $error'),
        duration: Duration(seconds: 2),
      ));
    });
  }
}

class ResourcesScreen extends StatelessWidget {
  // List of preloaded YouTube links
  final List<Map<String, String>> youtubeLinks = [
    {'title': 'INTRODUCTION TO FLUTTER', 'link': 'https://youtu.be/1xipg02Wu8s?si=F22LFMk35H2SLO_H'},
    {'title': 'DART is a alrounder', 'link': 'https://youtu.be/1xipg02Wu8s?si=F22LFMk35H2SLO_H'},
    // Add more YouTube links as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resources'),
      ),
      body: ListView.builder(
        itemCount: youtubeLinks.length,
        itemBuilder: (context, index) {
          // Extract the YouTube video ID from the link
          String? videoId = youtubeLinks[index]['link'];
          return GestureDetector(
            onTap: () {
              // Open the YouTube video in a browser or YouTube app
              _openYoutubeVideo(context, videoId!);
            },
            child: Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.play_circle_filled, color: Colors.red),
                  SizedBox(width: 12.0),
                  Text(
                    youtubeLinks[index]['title']!,
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Function to open the YouTube video
  void _openYoutubeVideo(BuildContext context, String videoId) {
    // Launch the YouTube URL
    launch(videoId);
  }
}

void main() {
  runApp(MaterialApp(
    home: CalendarScreen(),
  ));
}
