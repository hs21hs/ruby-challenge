def getOrderedLogs(logfile)

    logsArray = File.readlines(File.expand_path(logfile, File.dirname(__FILE__)))

    arrayOfLogsAsHashes = logsArray.map { |log|
        splitLog = log.split(' ')
        {name: splitLog[0], address: splitLog[1]}
    }

    pages = getVisitAddressesStoredWithEachPage(arrayOfLogsAsHashes)
    
    pagesWithViewCounts = addViewCountToPages(pages)

    pagesSortedByViews = pagesWithViewCounts.sort_by { |page| -page[:views]}
    pagesSortedByUniqueViews = pagesWithViewCounts.sort_by { |page| -page[:uniqueViews]}

    finalHashSortedByViews = {type: "sorted by views", list: pagesSortedByViews }
    finalHashSortedByUniqueViews = {type: "sorted by unique views", list: pagesSortedByUniqueViews}

    [finalHashSortedByViews, finalHashSortedByUniqueViews]
end

    def getVisitAddressesStoredWithEachPage(arrayOfLogsAsHashes)
        pages = []
        arrayOfLogsAsHashes.each do |log| 
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
        pages
    end

    def addViewCountToPages(pages)
        pages.map do |page|
            page[:views] = page[:addresses].length
            page[:uniqueViews] = page[:addresses].uniq.length
            page.delete(:addresses)
            page
        end
    end

# puts getOrderedLogs('webserver.log')