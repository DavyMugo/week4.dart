import 'dart:io';

// Interface for classes that can be initialized from a file
abstract class FileInitializable {
  void initializeFromFile(String filename);
}

// Parent class
class Shape {
  void draw() {
    print('Drawing shape...');
  }
}

// Child class implementing an interface
class Circle extends Shape implements FileInitializable {
  double radius =10;

  @override
  void draw() {
    print('Drawing circle with radius $radius');
  }

  @override
  void initializeFromFile(String filename) {
    try {
      final file = File(filename);
      final lines = file.readAsLinesSync();
      if (lines.length >= 1) {
        radius = double.parse(lines[0]);
      } else {
        print('File does not contain valid data.');
      }
    } catch (e) {
      print('Error reading file: $e');
    }
  }
}

void main() {
  // Create an instance of Circle and initialize it from a file
  final circle = Circle();
  circle.initializeFromFile('circle_data.txt');

  // Draw the circle
  circle.draw();

  // Method demonstrating the use of a loop
  printNumbers(5);
}

// Method demonstrating the use of a loop
void printNumbers(int n) {
  print('Printing numbers from 1 to $n:');
  for (int i = 1; i <= n; i++) {
    print(i);
  }
}
