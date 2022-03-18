String getCommentsQuery = """
  query getComments(\$page: Int!, \$limit: Int!) {
    comments(pagination: {
      limit: \$limit
      page: \$page
    }) {
      totalPages
      count
      currentPage
      data {
        id
        body
        post {
          id
          title
        }
        author{
          id
          name
        }
      }
    }
  }
""";

String createCommentMutation = """
  mutation createComment(
    \$postId: Int!,
    \$userId: Int!,
    \$body: String
  ) {
    addComment(
      data: {
        postId: \$postId
        userId: \$userId
        body: \$body
      }
    ){
      id
      body
      post {
        id
        title
      }
      author{
        id
        name
      }
    }
  }
""";