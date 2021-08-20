import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  late String blogId;
  DatabaseService({this.blogId = ''});

  // collection reference
  final CollectionReference blogRef =
      FirebaseFirestore.instance.collection('Blog');

  //FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // String getUserId() {
  //   return _firebaseAuth.currentUser!.uid;
  // }

  Future<void> addBlog(String Title, String desc, {int Totallike = 0}) async {
    return await blogRef.doc().set({
      //'blogId': blogId,
      'Title': Title,
      'desc': desc,

      'Totallike': Totallike,
    });
  }
}
