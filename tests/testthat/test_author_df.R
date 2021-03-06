context("Reading in Author Information")


expect_pass = function(expr) {
  # testthat::expect_that(object, !testthat::gives_warning())
  testthat::expect_failure(expect_warning(expr))
  testthat::expect_failure(expect_error(expr))
}


test_that("author_df_works", {

  authorized = is_elsevier_authorized()
  if (authorized) {
    expect_pass({
      dd = author_df(au_id = "40462056100", all_author_info = TRUE,
                     count = 25)
    })
  }

  if (authorized) {
    expect_pass({
      dd = author_df(au_id = "40462056100", all_author_info = FALSE,
                     count = 25)
    })
  }

  if (authorized) {
    expect_pass({
      dd = author_df(au_id = "8858259000", count = 25,
                     all_author_info = FALSE
      )
    })
  }

  if (authorized) {
    # testthat::expect_warning({
    expect_warning({
      dd = author_df(au_id = "8858259000", count = 25,
                     general = FALSE)
    })
  }
  if (authorized) {
    expect_pass({
      dd = author_list(au_id = "8858259000", count = 25)
    })
  }

})
