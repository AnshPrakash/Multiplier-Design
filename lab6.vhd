----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/13/2017 01:52:00 PM
-- Design Name: 
-- Module Name: lab6 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
entity selector is
    port( a,b,c: in std_logic_vector(15 downto 0);
          o:out std_logic_vector(15 downto 0);
          s:in std_logic_vector(1 downto 0));
end entity;

architecture behavioral of selector is
begin
    process(s,a,b,c)
    begin
        case s is
            when "00" => o<=a;
            when "01" => o<=b;
            when "10" => o<=c;
            when others =>null;
        end case;
    end process;
end architecture; 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d2_4 is
    port(t1,t2:in std_logic;
         o:out std_logic_vector(3 downto 0));
end entity;
architecture behavioral of d2_4 is
begin
    process(t1,t2)
    variable s:std_logic_vector(1 downto 0);
    begin
        s:=t1&t2;
        case s is
            when "00" => o <="0111";
            when "01" => o <="1011";
            when "10" => o <="1101";
            when "11" => o <="1110";
            when others => null;
        end case;
    end process;
end architecture;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ftp  is
  port (Q:out STD_LOGIC := '1';
        C:in STD_LOGIC;
        PRE:in STD_LOGIC;
        T:in STD_LOGIC);
end ftp;

architecture behavioral of ftp is
signal q_tmp : std_logic := '1';
begin
    process(C, PRE)
    begin
        if (PRE='1') then
            q_tmp <= '1';
        elsif (C'event and C = '1') then
            if(T='1') then
                q_tmp <= not q_tmp;
            end if;
        end if;  
    end process;
    Q <= q_tmp;
end Behavioral; 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity counter is
    port(clk:in std_logic;
         anode:out std_logic_vector(3 downto 0));
end entity;

architecture behavioral of counter is
component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
signal XLXI_1_PRE_openSignal : std_logic;
signal XLXI_2_PRE_openSignal : std_logic;
signal q1,q2:std_logic;
begin
    f1 : 
    entity WORK.ftp(behavioral)
      port map (C=>clk,
                PRE=>XLXI_1_PRE_openSignal,
                T=>'1',
                Q=>q1);
   
   f2 : 
   entity WORK.ftp(behavioral)
      port map (C=>clk,
                PRE=>XLXI_2_PRE_openSignal,
                T=>q1,
                Q=>q2);
   
   decoder :
   entity WORK.d2_4(behavioral)
      port map (t1=>q1,
                t2=>q2,
                o=>anode);
                
end architecture;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock5 is
    port(clk:in std_logic;
         pushbutton:in std_logic;
         clock: out std_logic);
end entity;

architecture behavioral of clock5 is
    signal counter:integer range 0 to 65536:=0;
    signal c:std_logic:='0';
begin
    process(clk)
    begin
        if pushbutton='1' then c<=clk;
        else
            if rising_edge(clk) then
                if counter=65536 then
                    c<=not(c);
                    counter<=0;
                else 
                    counter<=counter+1;
                end if;
            end if;
        end if;
        clock<=c;
    end process;
end architecture behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_digit is
    port(a:in std_logic_vector(3 downto 0);
         cathode:out std_logic_vector(6 downto 0));
end entity;

architecture behavioral of display_digit is
begin 
    process(a)
    begin
        case a is
              when "0000" => cathode <= "1000000";
              when "0001" => cathode <= "1111001";
              when "0010" => cathode <= "0100100";
              when "0011" => cathode <= "0110000";
              when "0100" => cathode <= "0011001";
              when "0101" => cathode <= "0010010";
              when "0110" => cathode <= "0000010";
              when "0111" => cathode <= "1111000";
              when "1000" => cathode <= "0000000";
              when "1001" => cathode <= "0010000";
              when "1010" => cathode <= "0001000";
              when "1011" => cathode <= "0000011";
              when "1100" => cathode <= "1000110";
              when "1101" => cathode <= "0100001";
              when "1110" => cathode <= "0000110";
              when "1111" => cathode <= "0001110";
              when others => NULL;
          end case;
     end process;
  
end architecture behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity select_digit is
    port(a,b:in std_logic_vector(7 downto 0);
         ano:in std_logic_vector(3 downto 0);
         o:out std_logic_vector(3 downto 0));
end entity;

architecture behavioral of select_digit is
begin
    process(ano)
    begin
        case ano is
            when "1110" => o <= b(3 downto 0);
            when "1101" => o <= b(7 downto 4);
            when "1011" => o <= a(3 downto 0);
            when "0111" => o <= a(7 downto 4);
            when others =>null;
        end case;
    end process;
end architecture;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_seg_display is
    port(p:in std_logic_vector(15 downto 0);
         clk:in std_logic;
         anode:out std_logic_vector(3 downto 0);
         cathode:out std_logic_vector(6 downto 0);
         pushbutton:in std_logic);       
end entity;

architecture behavioral of seven_seg_display is
signal anode_dummy,digit:std_logic_vector(3 downto 0);
signal clock:std_logic;
begin
    clck:
    entity WORK.clock5(behavioral)
              port map(clk=>clk,
                       pushbutton=>pushbutton,
                       clock=>clock);
                                        
    counter:
    entity WORK.counter(behavioral)
              port map(clk=>clock,
                       anode=>anode_dummy);
                          
    selectdigi:
    entity WORK.select_digit(behavioral)
              port map(a=>p(15 downto 8),
                       b=>p(7 downto 0),
                       ano=>anode_dummy,
                       o=>digit);
                         
    display:
    entity WORK.display_digit(behavioral)
             port map(a=>digit,
                      cathode=>cathode);
                      
    process(anode_dummy)
    begin
        anode<=anode_dummy;
    end process;
end architecture;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    port(s,cout:out std_logic;
         a,b,cin:in std_logic);
end entity;

architecture behavioral of full_adder is
signal p:std_logic;
begin
    p<=a xor b;
    s<=p xor cin;
    cout<=(a and b) or (p and cin);
end architecture;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder is
    port(a:in std_logic_vector(7 downto 0);
         b:in std_logic_vector(7 downto 0);
         cout:out std_logic;
         s:out std_logic_vector(7 downto 0));
end entity;

architecture behavioral of ripple_adder is
signal c:std_logic_vector(7 downto 0);
begin
    
    bitadd:entity WORK.full_adder(behavioral)
        port map(a=>a(0),b=>b(0),cin=>'0',cout=>c(0),s=>s(0));
    f:
    for i in 1 to 7 generate
        bitadd:entity WORK.full_adder(behavioral)
                    port map(a=>a(i),b=>b(i),cin=>c(i-1),cout=>c(i),s=>s(i));
    end generate;
    cout<=c(7);
end architecture;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity mul is
    port(a:in std_logic_vector(7 downto 0);
         b:in std_logic;
         o:out std_logic_vector(7 downto 0));
end entity;

architecture behavioral of mul is
begin
    f:
    for i in 0 to 7 generate
        o(i)<=a(i) and b;
    end generate;    
end architecture; 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity conc is
    port(c:in std_logic;
         p:in std_logic_vector(6 downto 0);
         t:out std_logic_vector(7 downto 0));
end entity;

architecture behavioral of conc is
begin
    t(7)<=c;
    t(6 downto 0)<=p;
end architecture;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier1 is
    port(a,b:in std_logic_vector(7 downto 0);
         o:out std_logic_vector(15 downto 0));
end entity;

architecture behavioral of multiplier1 is
subtype vec is std_logic_vector(7 downto 0); 
type twod_vec is array(0 to 7) of vec ; 
signal p,s,t:twod_vec;
signal c:std_logic_vector(7 downto 0);
begin   
    c(0)<='0';
    g1:
    for i in 0 to 7 generate
        mu:
        entity WORK.mul(behavioral)
            port map(a=>a,b=>b(i),o=>p(i));
    end generate;
    s(0)<=p(0);
    f:
    for i in 1 to 7 generate
        app:
        entity WORK.conc(behavioral)
            port map(c=>c(i-1),p=>s(i-1)(7 downto 1),t=>t(i-1));
        adder:
        entity WORK.ripple_adder(behavioral)
            port map(a=>p(i),b=>t(i-1),cout=>c(i),s=>s(i));
    end generate;
    
    o(15)<=c(7);
    o(14 downto 7)<=s(7);
    f1:
    for i in 0 to 6 generate
        o(i)<=s(i)(0);
    end generate;   
end architecture;
-----------special Full adder for CLA------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity sfull_adder is
    port(s:out std_logic;
         a,b,cin:in std_logic);
end entity;

architecture behavioral of sfull_adder is
signal p:std_logic;
begin
    p<=a xor b;
    s<=p xor cin;
end architecture;

---------------------CLA------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CLA is
 Port(a :in std_logic_vector(3 downto 0);
      b :in std_logic_vector(3 downto 0);
      cin: in std_logic;
      cout :out std_logic;
      s: out std_logic_vector(3 downto 0)
     );
end entity;
architecture behavioral of CLA is
signal p,g,c:std_logic_vector(3 downto 0);
begin
 p<=a or b;
 g<=a and b;
 c(0)<=(p(0)and cin) or g(0);
 c(1)<=(p(1)and p(0) and cin) or (p(1)and g(0)) or g(1);
 c(2)<=(p(2) and p(1) and p(0) and cin) or (p(2)and p(1) and g(0)) or (p(2) and g(1)) or g(2);
 c(3)<=(p(3)and p(2)and p(1)and p(0)and cin) or (p(3)and p(2)and p(1)and g(0)) or (p(3)and p(2)and g(1)) or (p(3)and g(2)) or g(3);
               
 cout<=c(3);
 f0:
 entity work.sfull_adder(behavioral) 
    port map(s=>s(0),
             a=>a(0),
             b=>b(0),
             cin=>cin
            );
 f1:
 for i in 1 to 3 generate
  kr:
  entity work.sfull_adder(behavioral) 
   port map(s=>s(i),
            a=>a(i),
            b=>b(i),
            cin=>c(i-1)
           );
 end generate;
 
end behavioral;
---------------Carry_Save_adder----------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity carry_save_adder is
    port(a,b,cin:in std_logic_vector(7 downto 0);
         o,cout:out std_logic_vector(7 downto 0));
end entity;

architecture behavioral of carry_save_adder is
begin
    f:
    for i in 0 to 7 generate
        bitadd:entity WORK.full_adder(behavioral)
                    port map(a=>a(i),b=>b(i),cin=>cin(i),cout=>cout(i),s=>o(i));
    end generate;
end architecture;
------------------append---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity append is
    port(c:in std_logic;
         p:in std_logic_vector(6 downto 0);
         t:out std_logic_vector(7 downto 0));
end entity;

architecture behavioral of append is
begin
    t(0)<=c;
    t(7 downto 1)<=p;
end architecture;
-------------------CLA with carryPropogate---------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity CLA_CP_adder is
 port(a,b: in std_logic_vector(7 downto 0);
      cout:out std_logic;
      s:out std_logic_vector(7 downto 0)
     );
end entity;
architecture behavioral of CLA_CP_adder is
signal c:std_logic;
signal k: std_logic;
begin
  c<='0';
  add1:
  entity work.CLA(behavioral)
   port map(
             a=>a(3 downto 0),
             b=>b(3 downto 0),
             cin=>c,
             cout=>k,
             s=>s(3 downto 0)
           );
  add2:
  entity work.CLA(behavioral)
     port map(
               a=>a(3 downto 0),
               b=>b(3 downto 0),
               cin=>k,
               cout=>cout,
               s=>s(3 downto 0)
             );
  end architecture;
-------------------Multiplier2---------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier2 is
    port(a,b:in std_logic_vector(7 downto 0);
         o:out std_logic_vector(15 downto 0));
end entity;

architecture behavioral of multiplier2 is
subtype vec is std_logic_vector(7 downto 0); 
type twod_vec is array(0 to 7) of vec ;
signal c,p,s,t1,t2:twod_vec;
signal carry:std_logic;
begin
    f:
    for i in 0 to 7 generate
        mu:
        entity WORK.mul(behavioral)
            port map(a=>a,b=>b(i),o=>p(i));
    end generate;
    c(0)<='0'&p(0)(7 downto 1);
    t2(1)<=p(1);
    f1:
    for i in 1 to 6 generate
        gent1:
        entity WORK.append(behavioral)
            port map(c=>'0',p=>p(i+1)(6 downto 0),t=>t1(i));
        gent2:
        entity WORK.conc(behavioral)
            port map(c=>p(i+1)(7),p=>s(i)(7 downto 1),t=>t2(i+1));
        csa:
        entity WORK.carry_save_adder(behavioral)
            port map(a=>t1(i),b=>t2(i),cin=>c(i-1),o=>s(i),cout=>c(i));
    end generate;
    
    cpa:
    entity WORK.ripple_adder(behavioral)
        port map(a=>c(6),b=>t2(7),cout=>carry,s=>s(7));
    o(15)<=carry;
    o(14 downto 7)<=s(7);
    o(0)<=p(0)(0);
    l:
    for i in 1 to 6 generate    
        o(i)<=s(i)(0);
    end generate;
end architecture;

-------------------Multipier3----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity multiplier3 is
 port(a,b:in std_logic_vector(7 downto 0);
      o: out std_logic_vector(15 downto 0)
     );
end entity;
architecture behavioral of multiplier3 is
subtype vec is std_logic_vector(7 downto 0); 
type twod_vec is array(0 to 7) of vec ;
signal c,p,s,t1,t2:twod_vec;
signal carry:std_logic;
begin----stll changes required----
f:
    for i in 0 to 7 generate
        mu:
        entity WORK.mul(behavioral)
            port map(a=>a,b=>b(i),o=>p(i));
    end generate;
    c(0)<='0'&p(0)(7 downto 1);
    t2(1)<=p(1);
    f1:
    for i in 1 to 6 generate
        gent1:
        entity WORK.append(behavioral)
            port map(c=>'0',p=>p(i+1)(6 downto 0),t=>t1(i));
        gent2:
        entity WORK.conc(behavioral)
            port map(c=>p(i+1)(7),p=>s(i)(7 downto 1),t=>t2(i+1));
        csa:
        entity WORK.carry_save_adder(behavioral)
            port map(a=>t1(i),b=>t2(i),cin=>c(i-1),o=>s(i),cout=>c(i));
    end generate;
    
    CLA_cpa:
    entity WORK.CLA_CP_adder(behavioral)
        port map(a=>c(6),b=>t2(7),cout=>carry,s=>s(7));
    o(15)<=carry;
    o(14 downto 7)<=s(7);
    o(0)<=p(0)(0);
    l:
    for i in 1 to 6 generate    
        o(i)<=s(i)(0);
    end generate;
  
end architecture;
---------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab6_multiplier is
    Port ( clk : in STD_LOGIC;
           in1 : in STD_LOGIC_VECTOR (7 downto 0);
           in2 : in STD_LOGIC_VECTOR (7 downto 0);
           display_button : in STD_LOGIC;
           multiplier_select : in STD_LOGIC_VECTOR (1 downto 0);
           anode : out STD_LOGIC_VECTOR (3 downto 0);
           cathode : out STD_LOGIC_VECTOR (6 downto 0);
           product : out STD_LOGIC_VECTOR (15 downto 0));
end entity;
    
architecture Behavioral of lab6_multiplier is
signal p1,p2,p3,p:std_logic_vector(15 downto 0);
begin
    m1:
    entity WORK.multiplier1(behavioral)
        port map(a=>in1,
                 b=>in2,
                 o=>p1);
    m2:
    entity WORK.multiplier2(behavioral)
        port map(a=>in1,
                 b=>in2,
                 o=>p2);             
    m3:
    entity WORK.multiplier3(behavioral)
        port map(a=>in1,
                 b=>in2,
                 o=>p3);
   

                  
    
    product<=p1;
    display:
    entity WORK.seven_seg_display(behavioral)
        port map(p=>p,
                 anode=>anode,
                 cathode=>cathode,
                 clk=>clk,
                 pushbutton=>display_button);
   
end Behavioral;


