package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

func init() {
	rootCmd.AddCommand(versionCmd)
}

var versionCmd = &cobra.Command{
	Use:   "version",
	Short: "Print version number of easy-ver",
	Long:  `Not all softare has versions.  This is easy-ver'`,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Printf("easy-ver tool - %v\n", projectVersion)
	},
}
