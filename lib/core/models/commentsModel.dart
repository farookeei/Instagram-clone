class CommentsModel {
  final String name;
  final String comments;

  CommentsModel({required this.comments, required this.name});
  static CommentsModel convert(Map? data) {
    if (data == null) return CommentsModel(comments: '', name: '');

    return CommentsModel(
      comments: data['username'],
      name: data['comments'],
    );
  }
}
