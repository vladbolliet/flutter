import 'package:flutter/material.dart';

class ActivityChooser extends StatefulWidget {
  @override
  _ActivityChooserState createState() => _ActivityChooserState();
}

class _ActivityChooserState extends State<ActivityChooser> {
  String selectedActivity = "Choose activity";
  List<String> activities = ["Running", "Swimming", "Cycling", "Reading", "Gaming"];
  int? _longPressedIndex; // Tracks which item is long-pressed

  void _showActivityChooser(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return Dialog( // Added missing "return Dialog("
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Container(
                width: 200,
                height: MediaQuery.of(context).size.height * 0.4,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromARGB(255, 53, 53, 53),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          Text("Choose an activity", style: TextStyle(fontSize: 20, color: Colors.white)),
                          Icon(Icons.expand_more, color: Colors.white),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey, // Line color
                      thickness: 1,       // Line thickness
                      height: 20,         // Space above and below the line
                    ),
                    SizedBox(height: 10),
                    // listview with long press and delete item
                    Expanded(
                      child: Scrollbar(
                        thumbVisibility: true,
                        child: ListView.builder(
                          itemCount: activities.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onLongPress: () { setDialogState(() { _longPressedIndex = index; }); },
                              child: Stack(
                                children: [
                                  ListTile(
                                    title: Text( activities[index], style: TextStyle(color: Colors.white), ), // actual list items
                                    onTap: () { setState(() { selectedActivity = activities[index]; }); Navigator.pop(context); }, // select item and close dialog
                                  ),
                                  // Small delete button at top-right when long-pressed
                                  if (_longPressedIndex == index) ... [
                                    Positioned(
                                      right: 10,
                                      top: 5,
                                      child: GestureDetector(
                                        onTap: () { _showDeleteConfirmation(context, index); },
                                        child: Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration( color: Colors.red, borderRadius: BorderRadius.circular(6), ),
                                          child: Icon(Icons.close, color: Colors.white, size: 16),
                                        ),
                                      ),
                                    ),
                                  ]
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.5),
                      child: TextButton(
                        onPressed: () => _showAddActivityDialog(context),
                        child: Text("+", style: TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    )
                  ]
                ),
              ),
            );
          }
        );
      },
    );
  }


  // Delete confirmation dialog
  void _showDeleteConfirmation(BuildContext context, int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(253, 53, 53, 53),
        title: Text("Confirm Delete", style: TextStyle(color: Colors.white)),
        content: Text("Are you sure you want to delete '${activities[index]}'?", style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {
              setState(() { _longPressedIndex = null; });
              Navigator.pop(context); // Close dialog
            },
            child: Text("Cancel", style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                activities.removeAt(index);
                _longPressedIndex = null; // Reset long-pressed state
              });
              Navigator.pop(context); // Close confirmation dialog
              Navigator.pop(context); // Close activity chooser dialog
              _showActivityChooser(context); // Reopen to refresh the list
            },
            child: Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },
  );
}

  // Add new activity dialog
  void _showAddActivityDialog(BuildContext context) {
    TextEditingController _activityController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black87,
          title: Text("Add Activity", style: TextStyle(color: Colors.white)),
          content: TextField(
            controller: _activityController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Enter activity",
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.black54,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel", style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () {
                String newActivity = _activityController.text.trim();
                if (newActivity.isNotEmpty && !activities.contains(newActivity)) {
                  setState(() {
                    activities.add(newActivity);
                  });
                  Navigator.pop(context); // Close dialog
                  //_showActivityChooser(context); // Reopen to refresh
                }
              },
              child: Text("Add", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => _showActivityChooser(context),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 68, 68, 68),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.28, // Fixed width
            child: Row(
              children: [
                Expanded( // Prevents overflow
                  child: Text(
                    selectedActivity,
                    overflow: TextOverflow.ellipsis, // Adds "..." if text is too long
                    maxLines: 1, // Ensures single-line text
                    style: TextStyle(
                      color: selectedActivity == "Choose activity" ? Colors.grey : Colors.white,
                    ),
                  ),
                ),
                Icon(Icons.expand_more, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    ); 
  }
}