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

SELECT party, SUM(total_votes) AS total_votes
FROM election_data
GROUP BY party
ORDER BY total_votes DESC;


SELECT candidate, party, total_votes
FROM election_data
ORDER BY total_votes DESC
LIMIT 10;


SELECT party, Round(AVG(vote_percentage), 3) AS avg_vote_percentage
FROM election_data
GROUP BY party
ORDER BY avg_vote_percentage DESC;


SELECT party, count(candidate) AS Total_Candidate
FROM election_data
GROUP BY party
ORDER BY Total_Candidate DESC;


SELECT constituency_id, SUM(total_votes) AS constituency_total_votes
FROM election_data
GROUP BY constituency_id
ORDER BY constituency_total_votes DESC;


SELECT candidate, party, total_votes
FROM election_data
WHERE party = 'Independent'
ORDER BY total_votes DESC
LIMIT 10;


SELECT candidate, vote_percentage, total_votes
FROM election_data
WHERE vote_percentage < 1.00
ORDER BY total_votes DESC;


SELECT a.constituency_id, a.candidate, a.party, a.total_votes
FROM election_data a
JOIN (
    SELECT constituency_id, MAX(total_votes) AS highest_votes
    FROM election_data
    GROUP BY constituency_id
) b
ON a.constituency_id = b.constituency_id
AND a.total_votes = b.highest_votes
ORDER BY a.total_votes DESC;


SELECT party, COUNT(party) AS constituency_wins
FROM (
    SELECT a.constituency_id, a.candidate, a.party, a.total_votes
    FROM election_data a
    JOIN (
        SELECT constituency_id, MAX(total_votes) AS highest_votes
        FROM election_data
        GROUP BY constituency_id
    ) b
    ON a.constituency_id = b.constituency_id
    AND a.total_votes = b.highest_votes
) winners
GROUP BY party
ORDER BY constituency_wins DESC;


SELECT party, Round(AVG(total_votes), 3) AS avg_total_votes
FROM election_data
GROUP BY party
ORDER BY avg_total_votes DESC;