-- =====================================================
-- Election Data Analysis Project
-- =====================================================

CREATE DATABASE election_project;

CREATE TABLE election_data (
    serial_no INT,
    candidate VARCHAR(255),
    party VARCHAR(255),
    evm_votes INT,
    postal_votes INT,
    total_votes INT,
    vote_percentage FLOAT,
    constituency_id VARCHAR(50)
);


-- =====================================================
-- Query 1: Total Votes by Party
-- =====================================================

SELECT 
    party,
    SUM(total_votes) AS total_votes
FROM election_data
GROUP BY party
ORDER BY total_votes DESC;


-- =====================================================
-- Query 2: Top 10 Candidates by Total Votes
-- =====================================================

SELECT 
    candidate,
    party,
    total_votes
FROM election_data
ORDER BY total_votes DESC
LIMIT 10;


-- =====================================================
-- Query 3: Average Vote Percentage by Party
-- =====================================================

SELECT 
    party,
    ROUND(AVG(vote_percentage), 3) AS avg_vote_percentage
FROM election_data
GROUP BY party
ORDER BY avg_vote_percentage DESC;


-- =====================================================
-- Query 4: Total Number of Candidates by Party
-- =====================================================

SELECT 
    party,
    COUNT(candidate) AS total_candidates
FROM election_data
GROUP BY party
ORDER BY total_candidates DESC;


-- =====================================================
-- Query 5: Total Votes by Constituency
-- =====================================================

SELECT 
    constituency_id,
    SUM(total_votes) AS constituency_total_votes
FROM election_data
GROUP BY constituency_id
ORDER BY constituency_total_votes DESC;


-- =====================================================
-- Query 6: Top Independent Candidates
-- =====================================================

SELECT 
    candidate,
    party,
    total_votes
FROM election_data
WHERE party = 'Independent'
ORDER BY total_votes DESC
LIMIT 10;


-- =====================================================
-- Query 7: Candidates with Less Than 1% Vote Share
-- =====================================================

SELECT 
    candidate,
    vote_percentage,
    total_votes
FROM election_data
WHERE vote_percentage < 1.00
ORDER BY total_votes DESC;


-- =====================================================
-- Query 8: Winning Candidate in Each Constituency
-- =====================================================

SELECT 
    a.constituency_id,
    a.candidate,
    a.party,
    a.total_votes
FROM election_data a
JOIN (
    SELECT 
        constituency_id,
        MAX(total_votes) AS highest_votes
    FROM election_data
    GROUP BY constituency_id
) b
ON a.constituency_id = b.constituency_id
AND a.total_votes = b.highest_votes
ORDER BY a.total_votes DESC;


-- =====================================================
-- Query 9: Party-wise Constituency Wins
-- =====================================================

SELECT 
    party,
    COUNT(party) AS constituency_wins
FROM (
    SELECT 
        a.constituency_id,
        a.candidate,
        a.party,
        a.total_votes
    FROM election_data a
    JOIN (
        SELECT 
            constituency_id,
            MAX(total_votes) AS highest_votes
        FROM election_data
        GROUP BY constituency_id
    ) b
    ON a.constituency_id = b.constituency_id
    AND a.total_votes = b.highest_votes
) winners
GROUP BY party
ORDER BY constituency_wins DESC;


-- =====================================================
-- Query 10: Average Total Votes by Party
-- =====================================================

SELECT 
    party,
    ROUND(AVG(total_votes), 3) AS avg_total_votes
FROM election_data
GROUP BY party
ORDER BY avg_total_votes DESC;
