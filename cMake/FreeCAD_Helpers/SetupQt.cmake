# -------------------------------- Qt --------------------------------

find_package(Qt5Core REQUIRED)
set(CMAKE_AUTOMOC TRUE)

# For FreeCAD 0.20, pegged to Ubutu 18.04 LTS:
if(${Qt5Core_VERSION} VERSION_LESS "5.9")
    message (FATAL_ERROR "FreeCAD v0.20 requires Qt5 5.9 or later")
endif()
find_package(Qt5Network REQUIRED)
find_package(Qt5Xml REQUIRED)
find_package(Qt5XmlPatterns REQUIRED)
find_package(Qt5Concurrent REQUIRED)
if(BUILD_GUI)
    find_package(Qt5Widgets REQUIRED)
    find_package(Qt5PrintSupport REQUIRED)
    find_package(Qt5OpenGL REQUIRED)
    find_package(Qt5Svg REQUIRED)
    find_package(Qt5UiTools REQUIRED)
    if (BUILD_WEB)
        if (${FREECAD_USE_QTWEBMODULE} MATCHES "Qt Webkit")
            find_package(Qt5WebKitWidgets REQUIRED)
        elseif(${FREECAD_USE_QTWEBMODULE} MATCHES "Qt WebEngine")
            find_package(Qt5WebEngineWidgets REQUIRED)
        else() # Automatic
            find_package(Qt5WebKitWidgets QUIET)
            if(NOT Qt5WebKitWidgets_FOUND)
                find_package(Qt5WebEngineWidgets REQUIRED)
            endif()
        endif()
    endif()
    if(MSVC)
      find_package(Qt5WinExtras QUIET)
    endif()
endif(BUILD_GUI)
