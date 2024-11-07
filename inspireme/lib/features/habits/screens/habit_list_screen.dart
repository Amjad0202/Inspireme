// lib/features/habits/screens/habit_list_screen.dart
class HabitListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Habits'),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => _showCalendarView(context),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return HabitCard(
            habit: habits[index],
            onTap: () => _openHabitDetails(context, habits[index]),
            onComplete: () => _markHabitComplete(habits[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _createNewHabit(context),
      ),
    );
  }
}