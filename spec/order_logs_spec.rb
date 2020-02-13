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

    it 'has a hash in index 0 which contains a list that is ordered by number of visits' do
        index0Hash = getOrderedLogs('test.log')[0]
        mostViewedPage = index0Hash[:list][0]
        secondMostViewedPage = index0Hash[:list][1]
        thirdMostViewedPage = index0Hash[:list][2] 
        fourthMostViewedPage = index0Hash[:list][3]

        expect(mostViewedPage[:name]).to eq('home')
        expect(secondMostViewedPage[:name]).to eq('profile')
        expect(thirdMostViewedPage[:name]).to eq('search')
        expect(fourthMostViewedPage[:name]).to eq('about')
    end

    it 'has a hash in index 1 which contains a list that is ordered by number of unique visits' do
        index1Hash = getOrderedLogs('test.log')[1]
        mostViewedPage = index1Hash[:list][0]
        secondMostViewedPage = index1Hash[:list][1]
        thirdMostViewedPage = index1Hash[:list][2] 
        fourthMostViewedPage = index1Hash[:list][3]

        expect(mostViewedPage[:name]).to eq('home')
        expect(secondMostViewedPage[:name]).to eq('search')
        expect(thirdMostViewedPage[:name]).to eq('profile')
        expect(fourthMostViewedPage[:name]).to eq('about')
    end

    it 'has a hash in index 0 which contains a list that specifies the correct number of visits to each page' do
        index0Hash = getOrderedLogs('test.log')[0]
        mostViewedPage = index0Hash[:list][0]
        secondMostViewedPage = index0Hash[:list][1]
        thirdMostViewedPage = index0Hash[:list][2] 
        fourthMostViewedPage = index0Hash[:list][3]

        expect(mostViewedPage[:views]).to eq(5)
        expect(secondMostViewedPage[:views]).to eq(4)
        expect(thirdMostViewedPage[:views]).to eq(3)
        expect(fourthMostViewedPage[:views]).to eq(1)
    end

    it 'has a hash in index 1 which contains a list that specifies the correct number of unique visits to each page' do
        index1Hash = getOrderedLogs('test.log')[1]
        mostViewedPage = index1Hash[:list][0]
        secondMostViewedPage = index1Hash[:list][1]
        thirdMostViewedPage = index1Hash[:list][2] 
        fourthMostViewedPage = index1Hash[:list][3]

        expect(mostViewedPage[:uniqueViews]).to eq(4)
        expect(secondMostViewedPage[:uniqueViews]).to eq(3)
        expect(thirdMostViewedPage[:uniqueViews]).to eq(2)
        expect(fourthMostViewedPage[:uniqueViews]).to eq(1)
    end

end