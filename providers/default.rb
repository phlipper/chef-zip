#
# Cookbook Name:: zip
# Provider:: default
#

# Support whyrun
def whyrun_supported?
  true
end

action :extract do
  description = "extract #{new_resource.name} ( #{new_resource.source} )"
  converge_by(description) do
    if new_resource.source == nil
      source = new_resource.name
    else
      source = new_resource.source
    end

    if new_resource.path == nil
      extract_path = "."
    else
      extract_path = new_resource.path
    end

    source_dir = ::File.dirname(source)
    log "extracting ZIP #{source} to #{extract_path} in #{source_dir}"

    bash "extract_#{source}" do
      cwd source_dir
      flags "-e"
      code <<-EOH
        unzip #{source} -d #{extract_path}
        chown -R #{new_resource.owner}:#{new_resource.group} #{extract_path}
        EOH
      #not_if { ::File.exists?(extract_path) }
    end


  end
end

