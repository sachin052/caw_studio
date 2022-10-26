class FeedPostUIEntity {
  final int postID;
  final String feedTag;
  final String timePostedAgo;
  final String profileURL;
  final String postURL;
  final String userName;
  final String postActionCreated;
  final String currentStatus;
  final String postTitle;
  final String postBody;
  final String location;
  final int likeCount;
  final int commentCount;
  final bool isLiked;

  FeedPostUIEntity(
      {required this.postID,
      required this.feedTag,
      required this.timePostedAgo,
      required this.profileURL,
      required this.postURL,
      required this.userName,
      required this.postActionCreated,
      required this.currentStatus,
      required this.postTitle,
      required this.postBody,
      required this.location,
      required this.likeCount,
      required this.commentCount,
      required this.isLiked});

  factory FeedPostUIEntity.generateDummyMOdel() {
    return FeedPostUIEntity(
        postID: 12,
        feedTag: "DIET",
        timePostedAgo: "1 min",
        profileURL:
            "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250",
        postURL:
            "https://images.freeimages.com/images/large-previews/106/photographer-1464286.jpg",
        userName: "sachin.062",
        postActionCreated: "asked a question",
        currentStatus: "Diagnosed",
        postTitle: "What are the signs and symptoms of skin cancer?",
        postBody:
            "I’ve been facing a few possibble symptoms of skin cancer. I’ve googled the possibilities but i thought i’d ask the community inste...See More",
        location: "Peninsula Park, Andheri, Mumbai",
        likeCount: 24,
        commentCount: 6,
        isLiked: false);
  }
}
