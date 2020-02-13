def getOrderedLogs(logfile)

    logs = File.readlines(File.expand_path(logfile, File.dirname(__FILE__)))

    splitLogs = logs.map { |log|
        splitLog = log.split(' ')
        {name: splitLog[0], address: splitLog[1]}
    }

    pages = []
    splitLogs.each do |log| 
        if pages.length>0 
            added = false
            pages.each { |page| 
                if page[:name] === log[:name] 
                    page[:addresses].push(log[:address])
                    added = true
                end
            }
            if added == false 
                pages.push({name: log[:name], addresses:[log[:address]]})
            end
        else 
            pages.push({name: log[:name], addresses:[log[:address]]})
        end
    end

    pagesWithViewCounts = pages.map do |page|
        page[:views] = page[:addresses].length
        page[:uniqueViews] = page[:addresses].uniq.length
        page.delete(:addresses)
        page
    end

    listSortedByViews = pages.sort_by { |page| -page[:views]}
    listSortedByUniqueViews = pages.sort_by { |page| -page[:uniqueViews]}

    sortedByViews = {type: "sorted by views", list: listSortedByViews }
    sortedByUniqueViews = {type: "sorted by unique views", list: listSortedByUniqueViews}

    [sortedByViews, sortedByUniqueViews]
end

#puts getOrderedLogs('webserver.log')