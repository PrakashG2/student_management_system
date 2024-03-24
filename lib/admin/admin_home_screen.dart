
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:table_calendar/table_calendar.dart';


class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [         
            // ElevatedButton(
            //   onPressed: () {
            //     // Handle Profile Management button press
            //   },
            //   child: Text('Profile Management'),
            // ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClassSchedulesScreen()),
                );
              },
              child: Text('Class Shedules'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExamsScreen()),
                );
              },
              child: Text('Exams'),
            ),
            SizedBox(height: 16),
           ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CalendarScreen()),
    );
  },
  child: Text('Calendar'),
),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle Notes button press
              },
              child: Text('Notes'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle Resources button press
              },
              child: Text('Resources'),
            ),
          ],
        ),
      ),
    );
  }
}

// ----------------------> CLASS SHEDULES


class ClassSchedulesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Schedules'),
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

void main() {
  runApp(MaterialApp(
    home: CalendarScreen(),
  ));
}
