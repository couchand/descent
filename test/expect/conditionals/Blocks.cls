public class Blocks
{
    Boolean happy = true;
    Boolean knowsIt = true;
    Boolean grounded = false;

    public void clapHands()
    {
        System.debug( '*CLAP*' );
    }

    public void chaChaCha()
    {
        System.debug( 'cha-cha-cha' );
    }

    public void playHookey()
    {
        System.debug( 'going to arcade' );
    }

    public void check()
    {
        if ( happy && knowsIt )
        {
            clapHands();
            chaChaCha();
        }
        else
        {
            showIt();
        }

        if ( !grounded )
        {
            playHookey();
        }
    }
}
