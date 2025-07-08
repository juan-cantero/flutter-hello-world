// Import the material design library - provides UI components like Scaffold, AppBar, etc.
import 'package:flutter/material.dart';

// StatefulWidget - A widget that can change its state over time
// This is the main screen for our counter app
class CounterFunctionScreen extends StatefulWidget {
  const CounterFunctionScreen({super.key});

  // Creates the state object for this widget
  @override
  State<CounterFunctionScreen> createState() => _CounterFunctionScreenState();
}

// The state class that holds the mutable data and logic for CounterFunctionScreen
class _CounterFunctionScreenState extends State<CounterFunctionScreen> {
  // State variable to keep track of the counter value
  int clickCounter = 0;
  
  // build() method is called whenever the widget needs to be rendered
  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic structure for a screen (appBar, body, floatingActionButton)
    return Scaffold(
      // AppBar at the top of the screen
      appBar: AppBar(
        // Centered title in the app bar
        title: Center(child: const Text('Counter function Screen')),
        // Left side icon button (currently does nothing)
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit)),
        // Right side actions in the app bar
        actions: [
          // Reset button - sets counter back to 0
          IconButton(
            onPressed: () => {
              // setState() tells Flutter to rebuild the widget with new data
              setState(() {
                clickCounter = 0;
              }),
            },
            icon: Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      // Main content area of the screen
      body: Center(
        // Column arranges widgets vertically
        child: Column(
          // Centers the content vertically
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the current counter value with large font
            Text(
              '$clickCounter', // String interpolation to show the counter value
              style: TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            // Display "Click" or "Clicks" based on counter value (singular/plural)
            Text(
              'Click${clickCounter == 1 ? '' : 's'}', // Conditional text based on counter
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      // Floating action buttons positioned at bottom right
      floatingActionButton: Column(
        // Aligns buttons to the bottom
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Plus button - increments counter
          CustomButton(
            icon: Icons.plus_one,
            // Arrow function that calls setState to increment counter
            onPressed: () => setState(() => clickCounter++),
          ),
          // Spacing between buttons
          SizedBox(height: 10),
          // Minus button - decrements counter
          CustomButton(
            icon: Icons.exposure_minus_1,
            // Arrow function that calls setState to decrement counter
            onPressed: () => setState(() => clickCounter--),
          ),
        ],
      ),
    );
  }
}

// Custom reusable button widget (StatelessWidget because it doesn't change)
class CustomButton extends StatelessWidget {
  // Properties that can be passed to this widget
  final IconData icon;         // The icon to display
  final VoidCallback? onPressed; // Function to call when pressed (nullable)

  // Constructor requires icon and onPressed parameters
  const CustomButton({super.key, required this.icon, required this.onPressed});

  // build() method defines how this widget looks
  @override
  Widget build(BuildContext context) {
    // FloatingActionButton is a circular button that floats above the content
    return FloatingActionButton(
      // StadiumBorder gives the button rounded ends
      shape: StadiumBorder(),
      // Function to execute when button is pressed
      onPressed: onPressed,
      // Icon displayed inside the button
      child: Icon(icon),
    );
  }
}
