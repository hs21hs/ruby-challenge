require_relative '../order_logs.rb'


RSpec.describe 'getOrderedLogs' do

    it 'returns an array with two elements' do
        lengthOfReturnedArray = getOrderedLogs('test.log').length
        expect(lengthOfReturnedArray).to eq(2)
    end

    it 'has a hash in index 0 which has a key of "type" whose value is "sorted by views"' do
        index0type = getOrderedLogs('test.log')[0][:type]
        expect(index0type).to eq("sorted by views")
    end

    it 'has a hash in index 1 which has a key of "type" whose value is "sorted by unique views"' do
        index1type = getOrderedLogs('test.log')[1][:type]
        expect(index1type).to eq("sorted by unique views")
    end

    it 'has a hash in index 0 which contains a list that has a length equal to number of unique pages' do
        lengthOfIndex0List = getOrderedLogs('test.log')[0][:list].length
        expect(lengthOfIndex0List).to eq(4)
    end

    it 'has a hash in index 1 which contains a list that has a length equal to number of unique pages' do
        lengthOfIndex1List = getOrderedLogs('test.log')[1][:list].length
        expect(lengthOfIndex1List).to eq(4)
    end



    it 'has a hash in index 0 which contains a list that has the correct most viewed page' do
        index0Hash = getOrderedLogs('test.log')[0]
        mostViewedPage = index0Hash[:list][0]

        expect(mostViewedPage[:name]).to eq('home')
    end

    it 'has a hash in index 0 which contains a list that has the correct second most viewed page' do
        index0Hash = getOrderedLogs('test.log')[0]
        secondMostViewedPage = index0Hash[:list][1]

        expect(secondMostViewedPage[:name]).to eq('profile')
    end

    it 'has a hash in index 0 which contains a list that has the correct third most viewed page' do
        index0Hash = getOrderedLogs('test.log')[0]
        thirdMostViewedPage = index0Hash[:list][2] 
       
        expect(thirdMostViewedPage[:name]).to eq('search')
    end

    it 'has a hash in index 0 which contains a list that has the correct least viewed page' do
        index0Hash = getOrderedLogs('test.log')[0]
        leastViewedPage = index0Hash[:list][3]

        expect(leastViewedPage[:name]).to eq('about')
    end


    it 'has a hash in index 1 which contains a list that has the correct most viewed page, ordered by unique views' do
        index1Hash = getOrderedLogs('test.log')[1]
        mostViewedPage = index1Hash[:list][0]

        expect(mostViewedPage[:name]).to eq('home')
    end

    it 'has a hash in index 1 which contains a list that has the correct second most viewed page, ordered by unique views' do
        index1Hash = getOrderedLogs('test.log')[1]
        secondMostViewedPage = index1Hash[:list][1]

        expect(secondMostViewedPage[:name]).to eq('search')
    end

    it 'has a hash in index 1 which contains a list that has the correct third most viewed page, ordered by unique views' do
        index1Hash = getOrderedLogs('test.log')[1]
        thirdMostViewedPage = index1Hash[:list][2] 
       
        expect(thirdMostViewedPage[:name]).to eq('profile')
    end

    it 'has a hash in index 1 which contains a list that has the correct least viewed page, ordered by unique views' do
        index1Hash = getOrderedLogs('test.log')[1]
        leastViewedPage = index1Hash[:list][3]

        expect(leastViewedPage[:name]).to eq('about')
    end



    it 'has a hash in index 0 which contains a list that specifies the correct number of visits to the most viewed page' do
        index0Hash = getOrderedLogs('test.log')[0]
        mostViewedPage = index0Hash[:list][0]

        expect(mostViewedPage[:views]).to eq(5)
    end

    it 'has a hash in index 0 which contains a list that specifies the correct number of visits to the second most viewed page' do
        index0Hash = getOrderedLogs('test.log')[0]
        secondMostViewedPage = index0Hash[:list][1]

        expect(secondMostViewedPage[:views]).to eq(4)
    end

    it 'has a hash in index 0 which contains a list that specifies the correct number of visits to third most viewed page' do
        index0Hash = getOrderedLogs('test.log')[0]
        thirdMostViewedPage = index0Hash[:list][2] 
 
        expect(thirdMostViewedPage[:views]).to eq(3)
    end

    it 'has a hash in index 0 which contains a list that specifies the correct number of visits to the least viewed page' do
        index0Hash = getOrderedLogs('test.log')[0]
        leastViewedPage = index0Hash[:list][3]

        expect(leastViewedPage[:views]).to eq(1)
    end

    
    it 'has a hash in index 1 which contains a list that specifies the correct number of unique visits to the most viewed page' do
        index1Hash = getOrderedLogs('test.log')[1]
        mostViewedPage = index1Hash[:list][0]

        expect(mostViewedPage[:uniqueViews]).to eq(4)
    end

    it 'has a hash in index 1 which contains a list that specifies the correct number of unique visits to the second most viewed page' do
        index1Hash = getOrderedLogs('test.log')[1]
        secondMostViewedPage = index1Hash[:list][1]

        expect(secondMostViewedPage[:uniqueViews]).to eq(3)
    end

    it 'has a hash in index 1 which contains a list that specifies the correct number of unique visits to the third most viewed page' do
        index1Hash = getOrderedLogs('test.log')[1]
        thirdMostViewedPage = index1Hash[:list][2] 
 
        expect(thirdMostViewedPage[:uniqueViews]).to eq(2)
    end

    it 'has a hash in index 1 which contains a list that specifies the correct number of unique visits to the least viewed page' do
        index1Hash = getOrderedLogs('test.log')[1] 
        leastViewedPage = index1Hash[:list][3]

        expect(leastViewedPage[:uniqueViews]).to eq(1)
    end

end