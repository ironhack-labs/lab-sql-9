create table if not exists bank.vklad_trans like bank.trans;

SELECT * FROM bank.vklad_trans limit 10;

insert into bank.vklad_trans
select * from bank.trans
where operation = 'VKLAD';

