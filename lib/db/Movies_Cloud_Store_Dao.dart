import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/db/model/Movies_Cloud_Store.dart';

class MoviesCloudStoreDao {
  static CollectionReference<MoviesCloudStore> getMoviesCollection() {
    return FirebaseFirestore.instance
        .collection(MoviesCloudStore.collectionName)
        .withConverter(
          fromFirestore:
              (snapshot, options) =>
                  MoviesCloudStore.fromFireStore(snapshot.data()),
          toFirestore: (movies, options) => movies.toFireStore(),
        );
  }

  static Future<void> addMovies(MoviesCloudStore movies) {
    var collection = getMoviesCollection();
    return collection.doc("${movies.id}").set(movies);
  }

  static Stream<List<MoviesCloudStore>> listenForTasks() async* {
    var stream = getMoviesCollection().snapshots();
    yield* stream.map(
      (querySnapShot) => querySnapShot.docs.map((doc) => doc.data()).toList(),
    );
  }

  static Future<void> removeTask(int movieId) {
    return getMoviesCollection().doc("${movieId}").delete();
  }

  static Future<List<MoviesCloudStore>> getAllWatchListMovies() async {
    var tasksSnapshot = await getMoviesCollection().get();
    var tasksList =
        tasksSnapshot.docs.map((snapshot) => snapshot.data()).toList();
    return tasksList;
  }
}
