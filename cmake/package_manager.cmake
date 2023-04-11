include(modules/cmake-package-manager/cmake/CPM.cmake)

set(CPM_PACKAGES ${CMAKE_CURRENT_LIST_DIR}/packages)

set(CPM_SOURCE_CACHE ${CMAKE_CURRENT_LIST_DIR}/../cache)

set(CPM_USE_LOCAL_PACKAGES ON)