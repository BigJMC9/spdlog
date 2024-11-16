project "spdlog"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"include/spdlog/**.h",
		"src/**.cpp"
	}

	includedirs {
		"include"
	 }

	filter "system:windows"
		systemversion "latest"

	filter "system:linux"
		pic "On"
		systemversion "latest"

	filter "configurations:Debug"
		defines 
		{ 
			"SPDLOG_DEBUG"; 
			"SPDLOG_COMPILED_LIB"; 
		}
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines 
		{ 
			"NDEBUG";
			"SPDLOG_COMPILED_LIB"; 
		}
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		defines 
		{ 
			"NDEBUG";
			"SPDLOG_COMPILED_LIB"; 
		}
		runtime "Release"
		optimize "on"
        symbols "off"