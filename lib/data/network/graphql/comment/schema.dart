String getComments = """
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