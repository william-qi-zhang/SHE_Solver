SheQiQi := module()

export plot_all_angles;

options package;

uses plots;

    plot_all_angles := proc(total)
    local plot_counter := 0:
    local i := 0:
    local modulation_solved := Array(1..31,1..150);
    local angles;

    for i from 1 by 1 to total do
        if i = 1 then read "n9_1_50.m"; angles := test;  print("i = ",i);
        elif i = 2 then read "n9_51_60.m"; angles := test; print("i = ",i);
        elif i = 3 then read "n9_60_80.m"; angles := test; print("i = ",i);
        elif i = 4 then read "n9_81_90.m"; angles := test; print("i = ",i);
        elif i = 5 then read "n9_90_99.m"; angles := test; print("i = ",i);
        elif i = 6 then read "n9_100_150.m"; angles := test; print("i = ",i);
        elif i = 7 then read "n9_151_170.m"; angles := test; print("i = ",i);
        elif i = 8 then read "n9_170_179.m"; angles := test; print("i = ",i);
        elif i = 9 then read "n9_180_190.m"; angles := test; print("i = ",i);
        elif i = 10 then read "n9_191_199.m"; angles := test; print("i = ",i);
        elif i = 11 then read "n9_200_250.m"; angles := test; print("i = ",i);
        elif i = 12 then read "n9_250_259.m"; angles := test; print("i = ",i);
        elif i = 13 then read "n9_260_270.m"; angles := test; print("i = ",i);
        elif i = 14 then read "n9_270_299.m"; angles := test; print("i = ",i);
        elif i = 15 then read "n9_300_350.m"; angles := test; print("i = ",i);
        elif i = 16 then read "n9_350_369.m"; angles := test; print("i = ",i);
        elif i = 17 then read "n9_370_389.m"; angles := test; print("i = ",i);
        elif i = 18 then read "n9_390_399.m"; angles := test; print("i = ",i);
        elif i = 19 then read "n9_400_430.m"; angles := test; print("i = ",i);
        elif i = 20 then read "n9_430_449.m"; angles := test; print("i = ",i);
        elif i = 21 then read "n9_450_469.m"; angles := test; print("i = ",i);
        elif i = 22 then read "n9_470_489.m"; angles := test; print("i = ",i);
        elif i = 23 then read "n9_490_499.m"; angles := test; print("i = ",i);
        elif i = 24 then read "n9_500_530.m"; angles := test; print("i = ",i);
        elif i = 25 then read "n9_530_549.m"; angles := test; print("i = ",i);
        elif i = 26 then read "n9_550_569.m"; angles := test; print("i = ",i);
        elif i = 27 then read "n9_570_589.m"; angles := test; print("i = ",i);
        elif i = 28 then read "n9_590_609.m"; angles := test; print("i = ",i);
        elif i = 29 then read "n9_610_629.m"; angles := test; print("i = ",i);
        elif i = 30 then read "n9_630_649.m"; angles := test; print("i = ",i);
        elif i = 31 then read "n9_650_669.m"; angles := test; print("i = ",i);
        end if:

        local mod_index := 0:
        local mod_total := nops(angles):
        # print(mod_total);
        for mod_index from 1 by 1 to mod_total do
            local solutions := nops(angles[mod_index,1]);
            local modulation := [seq(angles[mod_index,2],i=1..9)]:

            local counter := 0;
            local num_solution:=0;
            local color_solution:=["Purple","YellowGreen","YellowGreen","YellowGreen","YellowGreen","Purple","DarkSeaGreen","DarkSalmon","Goldenrod","IndianRed","Purple"];
            local symbol_solution:=["asterisk","diagonalcross","solidcircle","solidcircle","asterisk","solidbox","solidcircle","asterisk"];

            for counter from 1 by 1 to solutions do
                # print(angles[mod_index,1,counter,2]):
                local ele_level := 0:
                local max_ele_level := 1:

                local temp := 0:
                local patterns := [-1,1,1,-1,1,-1,1,-1,1]:
                for temp from 1 by 1 to 9 do 
                    if (angles[mod_index,1,counter,2,temp] <> patterns[temp]) then max_ele_level := 0: break; end if: 
                end do:
                #print(max_ele_level):
                
                if (max_ele_level = 1) then 
                    num_solution:=num_solution+1;
                    if num_solution>4 then
                        break:
                    end if:
                    if modulation[1] >= 6/100 then xtest := 4; else xtest := 3; end if:
                    if (xtest = num_solution) or (num_solution = 2) then   
                    plot_counter := plot_counter + 1:
                    p(plot_counter) := plot(modulation,angles[mod_index,1,counter,1],x=0..1,y=0..90,style = point,symbol=symbol_solution[num_solution],thickness=0,axis = [gridlines],color = color_solution[num_solution]):
                    # print(i,modulation,angles[mod_index,1,counter,1]);
                    modulation_solved[i,mod_index]:= modulation[1];
                    end if:
                end if:
            end do:
        end do:
    end do:
    print(evalf(modulation_solved));
    display([seq(p(i),i=1..plot_counter)]);
    end proc;

end module:
