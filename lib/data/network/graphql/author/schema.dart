String getAuthorsQuery = """
  query getUsers(\$page: Int, \$limit: Int) {
    users(pagination: {
      limit: \$limit
      page: \$page
    }) {
      totalPages
      count
      currentPage
      data {
        id
        name
        username
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
        company{
          name
          catchPhrase
          bs
        }
      }
    }
  }
""";
