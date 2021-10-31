function R = RollPitchYaw(roll,pitch,yaw)
    R=Rz(roll)*Ry(pitch)*Rx(yaw);
end