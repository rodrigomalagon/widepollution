test_that("rename_columns() correctly renames columns of a dataframe", {
  expect_equal(rename_columns(
    data.frame(a=rep(1,10),
               b=rep(2,10),
               c=rep(3,10)
               ),
    c('a','c'),
    c('first','third')),
    data.frame(first=rep(1,10),
               b=rep(2,10),
               third=rep(3,10)
    )
    )
})

test_that("rename_columns() correctly rename a single column of a dataframe", {
  expect_equal(rename_columns(
    data.frame(a=rep(1,10),
               b=rep(2,10),
               c=rep(3,10)
    ),
    'a',
    'first'),
    data.frame(first=rep(1,10),
               b=rep(2,10),
               c=rep(3,10)
    )
  )
})

test_that("rename_columns() shows error if old_colnames and new_colnames parameters don't match in length", {
  expect_error(rename_columns(
    data.frame(a=rep(1,10),
               b=rep(2,10),
               c=rep(3,10)
    ),
    c('a','b'),
    'first')
    )
})

test_that("rename_columns() shows error if old_colnames parameter is not a character vector", {
  expect_error(rename_columns(
    data.frame(a=rep(1,10),
               b=rep(2,10),
               c=rep(3,10)
    ),
    1,
    'first')
  )
})
