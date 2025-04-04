import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_realtime_mvvm/model/task_model.dart';


class TaskViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  List<TaskModel> tasks = [];
  bool _isLoadingMore = false;
    bool get isLoadingMore => _isLoadingMore;
  DocumentSnapshot? _lastDocument;
  final int _limit = 10;
  bool _hasMore = true;

  TaskViewModel() {
    _listenToTasks();
  }

  /// **Real-time Listener for Task Changes**
  void _listenToTasks() {
    _firestore.collection('tasks').orderBy('title').snapshots().listen((snapshot) {
      tasks = snapshot.docs.map((doc) => TaskModel.fromMap(doc.data() as Map<String, dynamic>, doc.id)).toList();
      notifyListeners();
    });
  }

  /// **Fetch More Tasks for Infinite Scrolling**
  Future<void> loadMoreTasks() async {
    if (_isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;
    notifyListeners();

    Query query = _firestore.collection('tasks').orderBy('title').limit(_limit);

    if (_lastDocument != null) {
      query = query.startAfterDocument(_lastDocument!);
    }

    QuerySnapshot snapshot = await query.get();
    if (snapshot.docs.isNotEmpty) {
      List<TaskModel> newTasks = snapshot.docs.map((doc) => TaskModel.fromMap(doc.data() as Map<String, dynamic>, doc.id)).toList();
      tasks.addAll(newTasks);
      _lastDocument = snapshot.docs.last; // Update last document for next batch
    } else {
      _hasMore = false; // No more tasks left to load
    }

    _isLoadingMore = false;
    notifyListeners();
  }

  /// **Edit an Existing Task**
  Future<void> editTask(String id, String newTitle) async {
    await _firestore.collection('tasks').doc(id).update({'title': newTitle});
  }

  /// **Add a New Task**
  Future<void> addTask(String title) async {
    await _firestore.collection('tasks').add({'title': title, 'completed': false});
  }

  /// **Toggle Task Completion**
  Future<void> toggleComplete(TaskModel task) async {
    await _firestore.collection('tasks').doc(task.id).update({'completed': !task.completed});
  }

  /// **Delete a Task**
  Future<void> deleteTask(String id) async {
    await _firestore.collection('tasks').doc(id).delete();
  }
}






