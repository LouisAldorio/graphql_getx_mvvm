String createPostMutation = """
  mutation createPost(\$userId: Int!, \$title: String!, \$body: String!) {
    addPost(data: {
      userId: \$userId
      title: \$title
      body: \$body
    }) {
      id
      title
      body
      author {
        id
        name
      }
    }
  }
""";

String getPostsQuery = """
  query getPosts(\$page: Int!, \$limit: Int!) {
    posts(pagination: {
      limit: \$limit
      page: \$page
    }) {
      totalPages
      count
      currentPage
      data {
        id
        title
        body
        author {
          id
          name
        }
      }
    }
  }
""";

String getPostDetailQuery = """
  query getPostDetail(\$id: ID!) {
    post(postId: \$id) {
      id
      title
      body
      author{
        id
        name
        email
        address {
          street
          suite
          city
          zipcode
          geo{
            lat
            lng
          }
        }
        phone
        website
        company {
          name
          catchPhrase
          bs
        }
      }
      comments{
        id
        body
        author{
          id
          name
        }
      }
    }
  }
""";
