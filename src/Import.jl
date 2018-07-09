include("Utils.jl")

"""
	import_project_information(config::Config, infoData; format::String="json")

update basic attributes of given REDCap project.

##Parameters:
* `config` - struct containing url and api-key
* `infoData` - data to be imported - pass as a file location to import from disk
* `format` - "json", "xml", "csv", or "odm". declares format of imported data

##Returns:
number of successfully imported values
"""

function import_project_information(config::Config, data; format::String="json")
	output = api_pusher("import", "project_settings", config, infoData = import_file_checker(data, format), format=format)
	return output
end


"""
	import_metadata(config::Config, metaData; format::String="json", returnFormat::String="json")

import metadata (i.e., Data Dictionary) into a project.

##Parameters:
* `config` - struct containing url and api-key
* `metaData` - data to be imported - pass as a file location to import from disk
* `format` - "json", "xml", "csv", or "odm". declares format of imported data
* `returnFormat` - error message format

##Returns:
number of successfully imported fields
"""

function import_metadata(config::Config, data; format::String="json", returnFormat::String="json")
	output = api_pusher("import", "metadata", config, metaData = import_file_checker(data, format), format=format, returnFormat=returnFormat)
	return output
end


"""
	import_user(config::Config, userData; format::String="json", returnFormat::String="json")

update/import new users into a project.

##Parameters:
* `config` - struct containing url and api-key
* `userData` - data to be imported - pass as a file location to import from disk
* `format` - "json", "xml", "csv", or "odm". declares format of imported data
* `returnFormat` - error message format

##Returns:
number of successfully imported users
"""

function import_user(config::Config, data; format::String="json", returnFormat::String="json")
	output = api_pusher("import", "user", config, userData = import_file_checker(data, format), format=format, returnFormat=returnFormat)
	return output
end

#=
Any[
	Dict{String,Any}(Pair{String,Any}("design", "1"),
					Pair{String,Any}("api_export", "1"),
					Pair{String,Any}("user_rights", "1"),
					Pair{String,Any}("data_access_groups", "1"),
					Pair{String,Any}("data_comparison_tool", "1"),
					Pair{String,Any}("username", "cory_cothrum@brown.edu"),
					Pair{String,Any}("data_access_group_id", ""),
					Pair{String,Any}("data_export", "1"),
					Pair{String,Any}("record_create", "1"),
					Pair{String,Any}("reports", "1"),
					Pair{String,Any}("data_import_tool", "1"),
					Pair{String,Any}("file_repository", "1"),
					Pair{String,Any}("mobile_app_download_data", "1"),
					Pair{String,Any}("mobile_app", "1"),
					Pair{String,Any}("email", "cory_cothrum@brown.edu"),
					Pair{String,Any}("data_quality_create", "1"),
					Pair{String,Any}("record_delete", "1"),
					Pair{String,Any}("calendar", "1"),
					Pair{String,Any}("lock_records_all_forms", "0"),
					Pair{String,Any}("firstname", ""),
					Pair{String,Any}("expiration", ""),
					Pair{String,Any}("data_access_group", ""),
					Pair{String,Any}("forms", Dict{String,Any}(Pair{String,Any}("demographics", "1"))),
					Pair{String,Any}("api_import", "1"),
					Pair{String,Any}("stats_and_charts", "1"),
					Pair{String,Any}("record_rename", "1"),
					Pair{String,Any}("lock_records_customization", "1"),
					Pair{String,Any}("logging", "1"),
					Pair{String,Any}("lock_records", "0"),
					Pair{String,Any}("data_quality_execute", "1"),
					Pair{String,Any}("manage_survey_participants", "1"),
					Pair{String,Any}("lastname", ""))
	]


=#

"""
	import_arms(config::Config, armData; override::Int=0, format::String="json", returnFormat::String="json")

update/import Arms into a project.

##Parameters:
* `config` - struct containing url and api-key
* `armData` - data to be imported - pass as a file location to import from disk
* `override` - 0 (false) 1 (true) - overwrites existing arms
* `format` - "json", "xml", "csv", or "odm". declares format of imported data
* `returnFormat` - error message format

##Returns:
number of successfully imported arms
"""

function import_arms(config::Config, data; override::Int=0, format::String="json", returnFormat::String="json")
	output = api_pusher("import", "arm", config, armData = import_file_checker(data, format), override=override, format=format, returnFormat=returnFormat)
	return output
end


"""
	import_events(config::Config, userData; override::Int=0, format::String="json", returnFormat::String="json")

update/import Events into a project.

##Parameters:
* `config` - struct containing url and api-key
* `userData` - data to be imported - pass as a file location to import from disk
* `override` - 0 (false) 1 (true) - overwrites existing events
* `format` - "json", "xml", "csv", or "odm". declares format of imported data
* `returnFormat` - error message format

##Returns:
number of successfully imported events
"""

function import_events(config::Config, data; override::Int=0, format::String="json", returnFormat::String="json")
	output = api_pusher("import", "event", config, userData = import_file_checker(data, format), override=override, format=format, returnFormat=returnFormat)
	return output
end


"""
	import_records(config::Config, data::Any; format::String="json", dtype::String="flat", 
						overwriteBehavior::String="normal", forceNumber::Bool=false, dateFormat::String="YMD",
						returnContent::String="count", returnFormat::String="json")

import a set of records for a project.

##Parameters:
* `config` - struct containing url and api-key
* `recordData` - data to be imported - pass as a file location to import from disk
* `format` - "json", "xml", "csv", or "odm". declares format of imported data
* `dtype` - "flat" (one record per row) or "eav" (one data point per row)
* `overwriteBehavior` - flag to decide if blank values overwrite existing values or not
* `forceNumber` - force auto-numbering and overwrite given id number
* `dateFormat` - "YMD", "MDY", or "DMY"
* `returnContent` - "count" (number of successfully uploaded records), 
						"ids" (list of record numbers imported), 
						"auto-ids" (pair of assigned id and given id)
* `returnFormat` - error message format

##Returns:
specified by returnContent
"""

function import_records(config::Config, recordData; format::String="json", dtype::String="flat", 
						overwriteBehavior::String="normal", forceNumber::Bool=false, dateFormat::String="YMD",
						returnContent::String="count", returnFormat::String="json")
	output = api_pusher("import", "record", config, data = import_file_checker(data, format), format=format, dtype=dtype, 
							overwriteBehavior=overwriteBehavior, forceNumber=forceNumber, dateFormat=dateFormat,
							returnContent=returnContent, returnFormat=returnFormat)
	return output
end


"""
	import_insrument_event_mappings(config::Config, instData; format::String="json", returnFormat::String="json")

import Instrument-Event Mappings into a project 

#NOTE: This only works for longitudinal projects.

##Parameters:
* `config` - struct containing url and api-key
* `data` - data to be imported - pass as a file location to import from disk
* `format` - "json", "xml", "csv", or "odm". declares format of imported data
* `returnFormat` - error message format

##Returns:
number of successfully imported inst-event mappings
"""

function import_insrument_event_mappings(config::Config, data; format::String="json", returnFormat::String="json")
	output = api_pusher("import", "formEventMapping", config, instData = import_file_checker(data, format), arms=arms, format=format, returnFormat=returnFormat)
	return output
end


"""
	import_file(config::Config, record::String, field::String, event::String, repeat_instance::Int, file;
					returnFormat::String="json")

upload a document to specific record/field.

##Parameters:
* `config` - struct containing url and api-key
* `record` - destination record id
* `field` - destination field
* `event` - destination event
* `repeat_instance` - number of repeated instances (long project)
* `file` - file to be imported
* `returnFormat` - error message format

##Returns:
nothing
"""

function import_file(config::Config, record::String, field::String, event::String, repeat_instance::Int, file::String;
					returnFormat::String="json")
	#load file up into memory?
	output = api_pusher("import", "file", config, record=record, field=field, event=event, repeat_instance=repeat_instance, 
							file=import_file(file), returnFormat=returnFormat)
	return output
end


"""
	create_project(config::Config, project_title::String, purpose::Integer; format::String="json",
						returnFormat::String="json", odm="NULL", purpose_other::String="", project_notes::String="", 
						is_longitudinal::Integer=0, surveys_enabled::Integer=0, record_autonumbering_enabled::Integer=1)

##Parameters:
* `config` - struct containing url and super-api-key
* `format` - "json", "xml", "csv", or "odm". declares format of imported data
* `data` - attributes of project to create- only project_title and purpose are required (* for default)
	* `project_title`: title
	* `purpose`: must be numerical (0 - test, 1 - other, 2 - research, 3 - Qual+, 4 - OpSupport)
	* `purpose_other`: if purpose 1- string of purpose
	* `project_notes`: notes
	* `is_longitudinal`: 0 - false*, 1 - true
	* `surveys_enabled`: 0 - false*, 1 - true
	* `record_autonumbering_enabled`: 0 - false, 1 - true*
* `returnFormat` - error message format
* `odm` - XML string containing metadata

##Returns:
The standard config
"""

function create_project(config::Config, project_title::String, purpose::Integer; format::String="json",
						returnFormat::String="json", odm="NULL", purpose_other::String="", project_notes::String="", 
						is_longitudinal::Integer=0, surveys_enabled::Integer=0, record_autonumbering_enabled::Integer=1)
	fields = Dict("token" => config.key,
					"content" => "project",
					"format" => format,
					"data" =>  Dict("project_title" => project_title,
									"purpose" => purpose,
									"purpose_other" => purpose_other,
									"project_notes" => project_notes,
									"is_longitudinal" => is_longitudinal,
									"surveys_enabled" => surveys_enabled,
									"record_autonumbering_enabled" => record_autonumbering_enabled),
					"returnFormat" => returnFormat,
					"odm" => odm)
	response = poster(config, fields)
	return Config(config.url, String(response.body))
end