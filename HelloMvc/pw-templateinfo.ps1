[cmdletbinding()]
param()

$templateInfo = New-Object -TypeName psobject -Property @{
    Name = 'SayedMvc'
    Type = 'ProjectTemplate'    
}

$templateInfo | replace (
    ('HelloMvc', {"$ProjectName"}, {"$DefaultProjectName"}),
    ('SolutionDir', {"$SolutionDir"}, {'..\..\'}),
    ('..\..\artifacts', {"$ArtifactsDir"}, {"$SolutionDir" + 'artifacts'}),
    ('e5bde977-3f5c-4310-8a23-b5694a869c88', {"$ProjectId"}, {[System.Guid]::NewGuid()})
)

# when the template is run any filename with the given string will be updated
$templateInfo | update-filename (
    ,('HelloMvc', {"$ProjectName"})
)
# excludes files from the template
$templateInfo | exclude-file 'pw-*.*','*.user','*.suo','*.userosscache','project.lock.json','*.vs*scc'
# excludes folders from the template
$templateInfo | exclude-folder '.vs','artifacts'

# This will register the template with pecan-waffle
Set-TemplateInfo -templateInfo $templateInfo
