import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_realtime_mvvm/model/task_model.dart';


class TaskViewModel extends ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;
  List<TaskModel> tasks = [];

  TaskViewModel() {
    _listenToTasks();
  }

  void _listenToTasks() {
    _firestore.collection('tasks').snapshots().listen((snapshot) {
      tasks = snapshot.docs.map((doc) => TaskModel.fromMap(doc.data(), doc.id)).toList();
      notifyListeners();
    });
  }
Future<void> editTask(String id, String newTitle) async {
  await _firestore.collection('tasks').doc(id).update({
    'title': newTitle,
  });
}

  Future<void> addTask(String title) async {
    await _firestore.collection('tasks').add({
      'title': title,
      'completed': false,
    });
  }

  Future<void> toggleComplete(TaskModel task) async {
    await _firestore.collection('tasks').doc(task.id).update({
      'completed': !task.completed,
    });
  }

  Future<void> deleteTask(String id) async {
    await _firestore.collection('tasks').doc(id).delete();
  }
}