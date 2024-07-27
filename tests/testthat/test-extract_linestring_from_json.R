test_that("extract_linestring_from_json() correctly extract an indicated linestring from a list", {
  expect_equal(extract_linestring_from_json_list(
    2,
    list(
      features=list(
        list(
          geometry = list(
            coordinates =list(
              c(0,0),c(0,1),c(1,1),c(1,0),c(0,0)
            )
          )
        ),
        list(
          geometry = list(
            coordinates =list(
              c(0,0),c(0,3),c(3,0),c(0,0)
            )
          )
        ),
        list(
          geometry = list(
            coordinates =list(
              c(-1,0),c(1,0),c(1,1),c(0,2),c(-1,1),c(-1,0)
            )
          )
        )
      )
    )
  )
    ,sf::st_linestring(matrix(c(0, 0 ,0, 3, 3, 0, 0, 0),ncol = 2,byrow=TRUE))
  )
})

test_that("extract_linestring_from_json() correctly converts erroneous double index to integer", {
  expect_equal(extract_linestring_from_json_list(
    2.5,
    list(
      features=list(
        list(
          geometry = list(
            coordinates =list(
              c(0,0),c(0,1),c(1,1),c(1,0),c(0,0)
            )
          )
        ),
        list(
          geometry = list(
            coordinates =list(
              c(0,0),c(0,3),c(3,0),c(0,0)
            )
          )
        ),
        list(
          geometry = list(
            coordinates =list(
              c(-1,0),c(1,0),c(1,1),c(0,2),c(-1,1),c(-1,0)
            )
          )
        )
      )
    )
  )
  ,sf::st_linestring(matrix(c(0, 0 ,0, 3, 3, 0, 0, 0),ncol = 2,byrow=TRUE))
  )
})

test_that("extract_linestring_json() aborts when passing an index out of range",{
  expect_error(
    extract_linestring_from_json_list(
      4,
      list(
        features=list(
          list(
            geometry = list(
              coordinates =list(
                c(0,0),c(0,1),c(1,1),c(1,0),c(0,0)
              )
            )
          ),
          list(
            geometry = list(
              coordinates =list(
                c(0,0),c(0,3),c(3,0),c(0,0)
              )
            )
          ),
          list(
            geometry = list(
              coordinates =list(
                c(-1,0),c(1,0),c(1,1),c(0,2),c(-1,1),c(-1,0)
              )
            )
          )
        )
      )
    )
  )
})
